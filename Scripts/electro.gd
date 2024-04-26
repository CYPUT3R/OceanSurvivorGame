extends Area2D

var attacking = false
var has_been_attacked = false

@export var damage = 7

func _ready():
	$Timer.start()
	
func _process(delta):
	pass
	#if attacking == true && has_been_attacked == false:
	#	var targets = has_overlapping_bodies()
	#	if targets == true:
	#		electro()
		
func electro():
	print ("you got electroed!")
	$/root/MainGame/Player/water_time.time += damage
	has_been_attacked = true

func _on_timer_timeout():
	attacking = true
	$Timer2.start()
	$Sprite2D.visible = true
	$CollisionShape2D.disabled = false
	has_been_attacked = false
	var timer = Timer.new()

func _on_timer_2_timeout():
	$Sprite2D.visible = false
	attacking = false
	$Timer.start()
	$CollisionShape2D.disabled = true
	var timer = Timer.new()


func _on_body_entered(body):
	if attacking == true && has_been_attacked == false and body.name == "Player":
		electro()
