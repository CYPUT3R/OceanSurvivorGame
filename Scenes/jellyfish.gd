extends Area2D

var oxygen_regain = 10
var given_oxygen = false



func give_oxygen():
	$/root/MainGame/Player/water_time.time -= oxygen_regain
	given_oxygen = true
	$/root/MainGame/pop_timer.start()
	self.visible = false
	self.process_mode = 4

func _on_pop_timer_timeout():
	given_oxygen = false
	process_mode = 0
	visible = true

func _on_body_entered(body):
	if body.name == "Player" and given_oxygen == false:
		give_oxygen()

