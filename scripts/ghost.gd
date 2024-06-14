extends CharacterBody2D

signal died

@export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(randi_range(-speed,speed),randi_range(-speed,speed))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#global_position = global_position+Vector2(randi_range(-speed,speed),randi_range(-speed,speed))
	velocity += Vector2(randi_range(-speed/3,speed/3),randi_range(-speed/3,speed/3))
	move_and_slide()
	var collision = move_and_collide(velocity*delta)
	if collision:
		print("hello" + collision.get_collider().name)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
