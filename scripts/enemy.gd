extends Node2D

signal died

@export var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position = global_position+Vector2(randi_range(-speed,speed),randi_range(-speed,speed))


func _on_ghost_area_entered(area):
	#bit mask value for collision laye
	match area.get_collision_layer():
		8:
			emit_signal("died")
			queue_free()


func _on_ghost_body_entered(body):
	match body.name:
		"Player":
			body.take_damage()
