extends CharacterBody2D
class_name Enemy

signal died

@export var health = 0
@export var speed = 0

var toPlayerDir = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	move_and_slide()

func find_player(playerPos):
	toPlayerDir = playerPos - global_position
	toPlayerDir = toPlayerDir.normalized()
	var toPlayerVelo = toPlayerDir*speed
	velocity = toPlayerVelo
