extends Node2D

signal enemy_spawned(enemy_instance)

var enemy = preload("res://scenes/ghost.tscn")

@onready var spawnPoints = $SpawnPoints

func spawn_enemy():
	var spawn_pos_arr = spawnPoints.get_children()
	var random_spawn_pos = spawn_pos_arr.pick_random()
	
	var enemy_instance = enemy.instantiate()
	enemy_instance.global_position = random_spawn_pos.global_position
	emit_signal("enemy_spawned", enemy_instance)


func _on_timer_timeout():
	spawn_enemy()
	
