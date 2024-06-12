extends CharacterBody2D

@export var speed = 128

var direction2d = Vector2(0,0)
var facingDirection = Vector2(0,0)

func _physics_process(delta):
	_movement_loop()
	
func _movement_loop():
	var hDirection = Input.get_axis("left","right")
	var vDirection = Input.get_axis("up","down")
	direction2d=Vector2(hDirection,vDirection)
	if(direction2d != Vector2(0,0)):
		facingDirection = direction2d
	velocity = direction2d*speed
	move_and_slide()
