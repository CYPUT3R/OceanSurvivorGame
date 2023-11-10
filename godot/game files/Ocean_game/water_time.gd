extends Timer

var time: float = 0.0

var is_in_water : bool = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) :
	
	
	if (!is_in_water):
		stop_timer()
	else:
		start_timer(delta)
	
func start_timer(delta):
	time += delta
	print (time)
	
	if(time >= 5):
		print("YOU DIE! :(")
		get_node("/root/MainGame/Player").is_dead = true
		
func stop_timer():
	
	
	time = 0.0



func _on_water_detection_2d_water_state_changed(is_in_Water : bool):
	self.is_in_water = is_in_Water
