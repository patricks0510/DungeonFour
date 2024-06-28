class_name Enemy
extends CharacterBody2D

signal died

@export var maxHealth = 0
@export var speed = 0
var currentHealth = maxHealth
var toPlayerDir = Vector2(0,0)

#@onready var healthBar = $Health2D/HealthBar
#@export var healthBar : TextureProgressBar
# Called when the node enters the scene tree for the first time.
func _ready():
	#healthBar.max_value = maxHealth
	#healthBar.value = currentHealth
	pass # Replace with function body.
	
func _physics_process(_delta):
	move_and_slide()

func _process(_delta):
	pass
	#healthBar.max_value = maxHealth
	#healthBar.value = currentHealth

func find_player(playerPos):
	toPlayerDir = playerPos - global_position
	toPlayerDir = toPlayerDir.normalized()
	var toPlayerVelo = toPlayerDir*speed
	velocity = toPlayerVelo

func take_damage(damageNum):
	currentHealth -= damageNum
	if currentHealth <= 0:
		emit_signal("died")
		queue_free()
	
