extends RigidBody2D

var is_in_water : bool = false

@export var swim_speed = 1

var is_player_inside = false
var is_picked = false
# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
	
	if (!is_in_water):
		self.gravity_scale = 1
	else:
		if (linear_velocity.x >= 200):
			linear_velocity.x -= 30
		if (linear_velocity.y >= 100):
			linear_velocity.y -= 100
		if (linear_velocity.x <= -200):
			linear_velocity.x += 30
		if (linear_velocity.y <= -400):
			linear_velocity.y += 100
			
		self.gravity_scale = -0.6
		
func _process(delta):
	if is_picked == true:
		pickup()
	else: 
		pass
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_interact") and is_player_inside and is_picked == false:
		is_picked = true
	if event.is_action_released("ui_interact"):
		is_picked = false

func pickup() -> void:
	global_position = $/root/MainGame/Player/Marker2D.global_position

func _on_water_detection_2d_water_state_changed(is_in_Water):
	self.is_in_water = is_in_Water


func _on_area_2d_body_entered(_Player: CharacterBody2D) -> void:
	is_player_inside = true


func _on_area_2d_body_exited(_Player: CharacterBody2D) -> void:
	is_player_inside = false
	
	
	

