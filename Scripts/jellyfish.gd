extends Area2D

@export var oxygen_regain = 5
var given_oxygen = false


func give_oxygen():
	$/root/MainGame/Player/water_time.time -= oxygen_regain
	given_oxygen = true
	$pop_timer.start()
	self.visible = false
	$Area2D.process_mode = 4
	$Area2D2.process_mode = 4

func _on_pop_timer_timeout():
	given_oxygen = false
	$Area2D.process_mode = 0
	$Area2D2.process_mode = 0
	self.visible = true

func _on_body_entered(body):
	if body.name == "Player" and given_oxygen == false:
		give_oxygen()

