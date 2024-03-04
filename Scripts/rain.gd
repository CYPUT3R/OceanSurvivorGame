extends ColorRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x = $/root/MainGame/Player.global_position.x - 800
	global_position.y = $/root/MainGame/Player.global_position.y - 400
