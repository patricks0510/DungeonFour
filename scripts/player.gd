extends CharacterBody2D

@export var speed = 128

var direction2d = Vector2(0,0)

func _physics_process(delta):
	var hDirection = Input.get_axis("left","right")
	var vDirection = Input.get_axis("up","down")
	direction2d=Vector2(hDirection,vDirection)
	velocity = direction2d*speed
	move_and_slide()
	
