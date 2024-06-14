extends Node2D

var enemy = preload("res://scenes/enemy.tscn")
var seconds_lapsed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_enemy():
	var newEnemy = enemy.instantiate()
	add_child(newEnemy)
