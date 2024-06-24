extends Node2D

signal enemy_spawned(enemy_instance)

@export var enemy = preload("res://scenes/ghost.tscn")

@onready var spawnPoints = $SpawnPoints

func spawn_enemy():
	var spawn_pos_arr = spawnPoints.get_children()
	var random_spawn_pos = spawn_pos_arr.pick_random()
	
	var enemy_instance = enemy.instantiate()
	enemy_instance.global_position = random_spawn_pos.global_position
	emit_signal("enemy_spawned", enemy_instance)

func get_agro_point(player_coords):
	var player_pos = player_coords[2]
	var enemy_list = get_children()
	for ghostNum in range(2,enemy_list.size()):
		var agro_dir = player_pos - enemy_list[ghostNum].global_position
		agro_dir = agro_dir.normalized()
		agro_dir *= enemy_list[ghostNum].speed
		enemy_list[ghostNum].velocity = agro_dir
	pass

func _on_timer_timeout():
	spawn_enemy()
	
