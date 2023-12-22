extends Area2D

var oxygen_regain = 20
var gyat = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gyat == true:
		pass
	
func give_oxygen():
	$/root/MainGame/Player/water_time.time -= oxygen_regain
	gyat = true
	$/root/MainGame/pop_timer.start()
	self.visible = false
	self.process_mode = 4

func _on_pop_timer_timeout():
	print("hhhh")
	gyat = false
	$/root/MainGame/jellyfish.process_mode = 0
	$/root/MainGame/jellyfish.visible = true
	

func _on_body_entered(body):
	if body.name == "Player" and gyat == false:
		give_oxygen()


