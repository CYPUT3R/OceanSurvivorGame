extends ColorRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $/root/MainGame/Player.is_in_water == true:
		$AnimationPlayer.play("blur")
		
	if $/root/MainGame/Player.is_in_water == false:
		$AnimationPlayer.play_backwards("blur")
