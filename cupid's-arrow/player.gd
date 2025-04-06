extends CharacterBody2D

const SPEED = 1000.0
const ACCEL = 5.0

var input: Vector2

func get_input():
	input.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	input.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	return input.normalized()

func _process(delta):
	var playerInput = get_input()
	
	velocity = lerp(velocity, playerInput * SPEED, delta * ACCEL)
	
	move_and_slide()
