extends Node2D

var current_weather = "sun" # sun, rain,
var action_done = false

func _on_timer_timeout():
	if current_weather == "sun" and action_done == false:
		print("rain")
		current_weather = "rain"
		$Timer.wait_time = randi_range(150, 200)
		$/root/MainGame/Rain_control/Rain/AnimationPlayer.play("rain")
		$/root/MainGame/rain_sounds.playing = true
		$/root/MainGame/rain_music.can_play = true
		$/root/MainGame/rain_music/Timer.start()
		$Timer.start()
		action_done = true
	if current_weather == "rain" and action_done == false:
		current_weather = "sun"
		print("sun")
		$Timer.wait_time = randi_range(25, 45)
		$/root/MainGame/rain_sounds.playing = false
		$/root/MainGame/rain_music.playing = false
		$/root/MainGame/rain_music.can_play = false
		$/root/MainGame/Rain_control/Rain/AnimationPlayer.play_backwards("rain")
		$Timer.start()
	action_done = false
