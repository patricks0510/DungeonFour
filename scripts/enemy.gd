extends CharacterBody2D
class_name Enemy

signal died

var ghost = preload("res://assets/ghost.png")

# Called when the node enters the scene tree for the first time.
func _ready(position:Vector2):
	
	var random_spawn_pos = spawn_pos_arr.pick_random()
	var ghost_instance = ghost.instantiate()
	ghost_instance.global_position = random_spawn_pos.global_position
	pass # Replace with function body.
	
