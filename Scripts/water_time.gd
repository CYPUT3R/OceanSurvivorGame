extends Timer

var time: float = 0.0

@export var regain_speed = 3
@export var max_swim_time: int = 5

var is_in_water : bool = false

@onready var GFX_bar = $/root/MainGame/CanvasLayer/Panel/HScrollBar

func _process(delta):
	GFX_bar.max_value = max_swim_time
	
	if time < -1:
		time = 0
		
	if (is_in_water):
		start_timer(delta)
	else:
		stop_timer(delta)
		
	if(time >= max_swim_time):
		print("YOU DIE! :(")
		get_node("/root/MainGame/Player").is_dead = true
	
func start_timer(delta):
	
	time += delta
	
	GFX_bar.value = GFX_bar.max_value - time
	
func stop_timer(delta):
	
	if (time >= 0):
		time -= delta * regain_speed
		GFX_bar.value = GFX_bar.max_value - time

func _on_water_detection_2d_water_state_changed(is_in_Water : bool):
	self.is_in_water = is_in_Water
