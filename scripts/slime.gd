extends Enemy

@onready var healthBar = $HealthBar

# Called when the node enters the scene tree for the first time.
func _ready():
	maxHealth = 30
	speed = 10
	currentHealth = maxHealth
	healthBar.max_value = maxHealth
	healthBar.value = currentHealth
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	healthBar.value = currentHealth
	pass
