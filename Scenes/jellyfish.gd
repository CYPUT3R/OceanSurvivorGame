extends StaticBody2D

var oxygen_regain = 20
var gyat = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var targets = $Area2D2.has_overlapping_bodies()
		
	if targets == true and gyat == false:
		give_oxygen()

func give_oxygen():
	$/root/MainGame/Player/water_time.time -= oxygen_regain
	gyat = true
	$/root/MainGame/pop_timer.start()
	self.visible = false
	self.process_mode = 4
	



func _on_pop_timer_timeout():
	print("hhhh")
	gyat = false
	self.visible = true
	self.process_mode = 0
