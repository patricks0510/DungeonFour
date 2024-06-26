extends CharacterBody2D
class_name Player
signal took_damage

@export var speed = 128

var direction2d = Vector2(0,0)
var facingDirection = Vector2(0,0)

func _physics_process(delta):
	_movement_loop(delta)
	
func _movement_loop(delta):
	var hDirection = Input.get_axis("left","right")
	var vDirection = Input.get_axis("up","down")
	direction2d=Vector2(hDirection,vDirection)*64
	if(direction2d != Vector2(0,0)):
		facingDirection = direction2d
	velocity = direction2d*speed*delta
	move_and_slide()

func take_damage():
	emit_signal("took_damage")

func die():
	#current pos being experimented with to lock camera after freeing character
	var currentPos = get_global_transform()
	queue_free()
	return currentPos

func _on_area_2d_body_entered(body):
	take_damage()
	body.queue_free()
	pass # Replace with function body.
