extends Sprite2D

var picked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if picked == true:
		$/root/MainGame/AnimatedSprite2D.has_key = true
		self.visible = false
	else:
		pass
	



func _on_area_2d_body_entered(_player: CharacterBody2D):
	picked = true




func _on_area_2d_body_exited(_player: CharacterBody2D):
	picked = false
