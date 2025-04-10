extends Node2D

@onready var map = get_node("/root/Map")

var enemy_scene := preload("res://enemy.tscn")
var spawn_points := []

func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)
	

func _on_timer_timeout():
	var spawn = spawn_points[randi() % spawn_points.size()]
	var enemy = enemy_scene.instantiate()
	enemy.position = spawn.position
	map.add_child(enemy)
	
