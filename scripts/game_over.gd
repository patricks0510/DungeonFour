extends Control

#@onready var scoreLabel = $Panel/ScoreLabel

func set_score(new_score):
	$Panel/ScoreLabel.text = "SCORE: " + str(new_score)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_restart_button_pressed():
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	get_tree().quit()
