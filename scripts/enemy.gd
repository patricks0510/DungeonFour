extends Node2D

signal died

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ghost_area_entered(area):
	print(area.get_collision_layer())
	if(area.get_collision_layer() == 8):
		emit_signal("died")
		queue_free()
