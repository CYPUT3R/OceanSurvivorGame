extends Node2D

func _on_animated_sprite_2d_animation_finished():
	Load.load_scene("res://Scenes/main_game.tscn")
