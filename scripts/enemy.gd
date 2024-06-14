extends Node2D

signal died

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	global_position = Vector2(randi_range(-250,250),randi_range(-250,250))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ghost_area_entered(area):
	#bit mask value for collision laye
	if(area.get_collision_layer() == 8):
		emit_signal("died")
		queue_free()
