extends Timer

var time: float = 0.0
var seconds: int = 0
var minutes: int = 0

@export var max_swim_time: int = 5

var is_in_water : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) :
	if (is_in_water):
		start_timer(delta)
	else:
		stop_timer(delta)
	
func start_timer(delta):
	
	$/root/MainGame/CanvasLayer/Panel/HScrollBar.max_value = max_swim_time
	time += delta
	seconds  = fmod(time, 60)
	minutes  = fmod(time, 3600) / 60
	
	$/root/MainGame/CanvasLayer/Panel/HScrollBar.value = $/root/MainGame/CanvasLayer/Panel/HScrollBar.max_value - time
	
	if(time >= max_swim_time):
		print("YOU DIE! :(")
		get_node("/root/MainGame/Player").is_dead = true
		
func stop_timer(delta):
	
	if (time >= 0):
		time -= delta
		$/root/MainGame/CanvasLayer/Panel/HScrollBar.value = $/root/MainGame/CanvasLayer/Panel/HScrollBar.max_value - time

func _on_water_detection_2d_water_state_changed(is_in_Water : bool):
	self.is_in_water = is_in_Water
