extends Area2D

var direction = Vector2.RIGHT
var speed = 300

func _ready():
	rotation = direction.angle()

func _process(delta):
	position -= direction * speed * delta
	
func set_direction(dir: Vector2):
	if dir.length() == 0:
		direction = Vector2.RIGHT
	else:
		direction = dir.normalized()
		rotation = direction.angle()

func _on_bullet_body_entered(body: Node2D) -> void:
	
	if body.has_method("take_damage"):
		body.take_damage(1)

	queue_free()
	
