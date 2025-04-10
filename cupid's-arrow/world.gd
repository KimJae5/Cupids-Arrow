extends Node2D

var enemy_scene = preload("res://enemy.tscn")


func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instance()
	enemy.position = Vector2(randf_range(20, 1000), -20)
	add_child(enemy)
