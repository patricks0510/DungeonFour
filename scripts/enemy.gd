extends CharacterBody2D
class_name Enemy

signal died

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	move_and_slide()
