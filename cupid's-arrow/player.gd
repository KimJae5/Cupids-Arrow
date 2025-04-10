extends CharacterBody2D

signal player_shoot(position, direction)

const speed = 400
const ACCEL = 5.0

var input: Vector2

func get_input():
	input.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	input.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	return input.normalized()
	

func _physics_process(_delta):
	var playerInput = get_input()
	velocity = playerInput.normalized() * speed
	
	if Input.is_action_just_pressed("Shoot"):
		var mouse_pos = get_global_mouse_position()
		var dir = mouse_pos - global_position
		emit_signal("player_shoot", global_position, dir)


	move_and_slide()
	
