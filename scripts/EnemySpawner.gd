extends Node2D

signal enemy_spawned(enemy_instance)

@export var enemy = preload("res://scenes/ghost.tscn")

@onready var spawnPoints = $SpawnPoints

func spawn_enemy():
	var spawn_pos_arr = spawnPoints.get_children()
	var random_spawn_pos = spawn_pos_arr.pick_random()
	
	var enemy_instance = enemy.instantiate()
	enemy_instance.transform = random_spawn_pos.transform
	emit_signal("enemy_spawned", enemy_instance)

func get_agro_point(player_coords):
	var playerPos = player_coords[2]
	var enemy_list = get_children()
	#remove at called twice to ignore spawnPoints and Timer nodes
	enemy_list.remove_at(0)
	enemy_list.remove_at(0)
	
	for baddie in enemy_list:
		baddie.find_player(playerPos)
		

func _on_timer_timeout():
	spawn_enemy()
	
