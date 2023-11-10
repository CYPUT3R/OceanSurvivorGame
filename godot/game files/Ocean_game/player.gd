extends CharacterBody2D

@export var speed = 400.0
@export var jump_velocity = -650.0
@export var swim_jump : float = -100
@export var gravity_multiplier = 2.0
@export var swim_gravity : float = 0.25
@export var swim_velocity_cap : float = 200
@export var swim_speed : float = 100



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_in_water : bool = false

var is_dead : bool = false


func _physics_process(delta):
	
	
	if is_dead == false:
		
		var direction = Input.get_axis("ui_left", "ui_right")
		
		
		if(!is_in_water):
			velocity.y += gravity * delta * gravity_multiplier
		else:
			
			velocity.y = clampf(velocity.y + (gravity * delta * swim_gravity), -10000, swim_velocity_cap)
			
		
		
		if direction:
			velocity.x = direction * speed
			if direction < 0:
				$GFX.flip_h = true
			else:
				$GFX.flip_h = false
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
				
		# Handle Jump.
		if Input.is_action_just_pressed("ui_accept"):
			if is_on_floor():
				velocity.y = jump_velocity
			if is_in_water == true:
				velocity.y += swim_jump
			
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		if(!is_in_water):
			if direction:
				velocity.x = direction * speed
			else:
				velocity.x = move_toward(velocity.x, 0, speed)
		else:
			if direction:
				velocity.x = direction * swim_speed
			else:
				velocity.x = move_toward(velocity.x, 0, swim_speed)
		move_and_slide()
		
		if velocity.x != 0:
			$GFX/AnimationPlayer.play("walk")
		else:
			$GFX/AnimationPlayer.play("idle")
	else:
		dead(delta)
		
func dead(delta):
	is_dead = true
	$CollisionShape2D.disabled = true
	$WaterDetection2D/CollisionShape2D.disabled = true
	print("you Died even more")


func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * gravity_multiplier * delta
		



func _on_water_detection_2d_water_state_changed(is_in_Water : bool):
	self.is_in_water = is_in_Water
	print(is_in_Water)
