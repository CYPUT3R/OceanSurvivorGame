extends Sprite2D

var is_player_inside: bool = false
var is_opened: bool = false
var not_been_opened: bool = true
@export var oxygen_reward = 20
var has_key: bool = false

func _process(_delta) -> void:
	if is_opened == true and not_been_opened == true:
		_expand_air()
		frame = 1
		not_been_opened = false
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_interact") and is_player_inside and is_opened == false and has_key == true:
		is_opened = true
		
func _expand_air() -> void:
	$/root/MainGame/Player/water_time.max_swim_time += oxygen_reward
	$/root/MainGame/Player/water_time.time = 0
	print($/root/MainGame/Player/water_time.max_swim_time)
	

func _on_area_2d_body_entered(_player: CharacterBody2D) -> void:
	is_player_inside = true

func _on_area_2d_area_shape_exited(_player: CharacterBody2D) -> void:
	is_player_inside = false
