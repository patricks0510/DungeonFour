extends Node2D

var score = 0
var lives = 5

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var enemySpawner = $EnemySpawner
var magicMissile = preload("res://scenes/spell.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	hud.set_score_label(score)
	hud.set_lives_label(lives)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space"):
		shoot_missile()

func shoot_missile():
	var newMissile = magicMissile.instantiate()
	add_child(newMissile)
	newMissile.global_position = player.global_position
	newMissile.direction = player.facingDirection

func _on_enemy_died():
	score += 100
	hud.set_score_label(score)

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)


func _on_player_took_damage():
	lives -= 1
	hud.set_lives_label(lives)
