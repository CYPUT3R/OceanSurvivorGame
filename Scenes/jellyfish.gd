extends StaticBody2D

var oxygen_regain = 10
var gyat = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var targets = $Area2D2.has_overlapping_bodies()
		
	if targets == true and gyat == false:
		give_oxygen()

func give_oxygen():
	$/root/MainGame/Player/water_time.time -= oxygen_regain
	gyat = true
	$/root/MainGame/pop_timer.start()
	$/root/MainGame/jellyfish.process_mode = 4
	$/root/MainGame/jellyfish.visible = false
	



func _on_pop_timer_timeout():
	print("hhhh")
	gyat = false
	$/root/MainGame/jellyfish.process_mode = 0
	$/root/MainGame/jellyfish.visible = true
