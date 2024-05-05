extends CanvasLayer

func _on_start_pressed():
	Load.load_scene("res://Scenes/beggining.tscn")

func _on_quit_pressed():
	get_tree().quit()
