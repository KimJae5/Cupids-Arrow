extends Area2D

var speed := 500.0
var direction := Vector2.RIGHT

func _ready():
	rotation = direction.angle()
	print("BULLET READY:", direction)

func _process(delta):
	position += direction * speed * delta
	print("MOVING:", position)
