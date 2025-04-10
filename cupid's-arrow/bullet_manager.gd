extends Node2D

@export var bullet_scene : PackedScene

func _on_player_player_shoot(pos, dir):
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	bullet.global_position = pos
	bullet.direction = dir.normalized()
	
