extends RigidBody2D

var is_player_inside = false
var is_picked = false

func _process(delta):
	if is_picked == true:
		pickup()
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_interact") and is_player_inside and is_picked == false && $/root/MainGame/bottle.can_pick == true:
		is_picked = true
		print("f")
	if event.is_action_released("ui_interact"):
		is_picked = false
		$CollisionShape2D.disabled = false

func pickup() -> void:
	$CollisionShape2D.disabled = true
	global_position = $/root/MainGame/Player/Marker2D.global_position
	

func _on_area_2d_body_entered(body) -> void:
	if body.name == "Player":
		is_player_inside = true
		print("i")


func _on_area_2d_body_exited(body) -> void:
	if body.name == "Player":
		is_player_inside = false
	
	
	

