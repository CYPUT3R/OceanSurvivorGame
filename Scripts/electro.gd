extends Area2D

var attacking = false
var has_been_attacked = false

func _ready():
	$Timer.start()
	
func _process(delta):
	
	if attacking == true && has_been_attacked == false:
		var targets = has_overlapping_bodies()
		if targets == true:
			print ("you got electroed!")
			$/root/MainGame/Player/water_time.time += 5
			has_been_attacked = true
			
func _on_timer_timeout():
	attacking = true
	$Timer2.start()
	$Sprite2D.visible = true
	has_been_attacked = false
	var timer = Timer.new()

func _on_timer_2_timeout():
	$Sprite2D.visible = false
	attacking = false
	$Timer.start()
	var timer = Timer.new()
