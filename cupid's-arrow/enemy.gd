extends CharacterBody2D

@onready var map = get_node("/root/Map")
@onready var player = get_node("/root/Map/Player")
@export var normal_texture : Texture
@export var damaged_texture : Texture
 
var entered : bool
var speed : int = 150
var direction : Vector2


func _ready():
	current_health = max_health
	var screen_rect = get_viewport_rect()
	entered = true
	var dist = screen_rect.get_center() - position
	if abs(dist.x) < abs(dist.y):
		direction.x = dist.x
		direction.y = 0
	else:
		direction.x = 0
		direction.y = dist.y
	
	$Sprite2D.texture = normal_texture

func _physics_process(_delta):
	if entered:
		direction = (player.position - position)
		direction = direction.normalized()
		velocity = direction * speed
		move_and_slide()
		
@export var max_health = 15
var current_health = 0

func take_damage(amount: int):
	current_health -= amount
	update_health_bar()

	if current_health <= 3:
		show_critical_image()

	if current_health <= 0:
		die()
		
func die():
	queue_free()

func update_health_bar():
	$ProgressBar.value = current_health
	$Sprite2D.texture = normal_texture

func show_critical_image():
	$Sprite2D.texture = damaged_texture
