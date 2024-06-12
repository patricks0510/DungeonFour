extends Node2D

@onready var player = $Player
var magicMissile = preload("res://scenes/spell.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space"):
		shoot_missile()
		
func shoot_missile():
	var newMissile = magicMissile.instantiate()
	add_child(newMissile)
	newMissile.global_position = player.global_position
	newMissile.direction = player.direction2d
	
