extends Node2D

var score = 0
@export var lives = 5

@onready var player = $Player
@onready var ui = $UI
@onready var hud = $UI/HUD
@onready var enemySpawner = $EnemySpawner
@onready var slimeSpawnwer = $SlimeSpawner
var magicMissile = preload("res://scenes/spell.tscn")
var gameOverScreen = preload("res://scenes/game_over.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	hud.set_score_label(score)
	hud.set_lives_label(lives)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null:
		enemySpawner.get_agro_point(player.get_global_transform())
		slimeSpawnwer.get_agro_point(player.get_global_transform())
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
	enemySpawner.add_child(enemy_instance)
	
func _on_slime_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	slimeSpawnwer.add_child(enemy_instance)

func _on_player_took_damage():
	lives -= 1
	hud.set_lives_label(lives)
	if lives <= 0:
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var gos = gameOverScreen.instantiate()
		gos.set_score(score)
		ui.add_child(gos)



