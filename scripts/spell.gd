extends Node2D

@export var direction = Vector2(0,0)
@export var speed = 4

@onready var spell = $SpellParticle
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(direction == Vector2(0,0)):
		direction = Vector2(1,0)
	global_position += direction*speed*delta

func _physics_process(delta):
	pass

func _on_timer_timeout():
	spell.emitting = false
	fade_spell()
	

func fade_spell():
	await get_tree().create_timer(1.0).timeout
	queue_free()
	
func _on_area_2d_body_entered(body):
	match body.get_collision_layer():
		4:
			body.get_parent().emit_signal("died")
			fade_spell()
			body.get_parent().queue_free()
