extends "res://scripts/enemy.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 30
	speed = 10
	pass # Replace with function body.
		##print(collision.get_collision_layer_value())
		##match collision.get_collider():
			##Player:
				##print(collision.get_collider_shape())
				##velocity = Vector2(0,0)
				##collision.get_collider().take_damage()
				##print("player collides with ghost")
			##TileMap:
				##print("hit wall")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
