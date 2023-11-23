extends RigidBody2D

var is_in_water : bool = false

@export var swim_speed = 1

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




func _on_water_detection_2d_water_state_changed(is_in_Water):
	self.is_in_water = is_in_Water
