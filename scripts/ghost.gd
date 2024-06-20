extends CharacterBody2D

signal died

@export var speed = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(randi_range(-speed,speed),randi_range(-speed,speed))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#global_position = global_position+Vector2(randi_range(-speed,speed),randi_range(-speed,speed))
	velocity += Vector2(randi_range(-speed/3.0,speed/3.0)*delta,randi_range(-speed/3.0,speed/3.0)*delta)
	move_and_slide()
	#if collision:
		#print(collision.get_collision_layer_value())
		#match collision.get_collider():
			#Player:
				#print(collision.get_collider_shape())
				#velocity = Vector2(0,0)
				#collision.get_collider().take_damage()
				#print("player collides with ghost")
			#TileMap:
				#print("hit wall")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	emit_signal("died")
	pass # Replace with function body.
