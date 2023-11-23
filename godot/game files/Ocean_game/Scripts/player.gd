extends CharacterBody2D

@export var speed = 600
@export var jump_velocity = -1200
@export var swim_jump : float = -400
@export var gravity_multiplier = 3
@export var swim_gravity : float = 0.4
@export var swim_velocity_cap : float = 150
@export var swim_speed : float = 500

var time = 0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_in_water : bool = false
var is_dead : bool = false


func _physics_process(delta):
	if is_dead == false:
		
		#Recieve input
		var direction = Input.get_axis("ui_left", "ui_right")
		
		if direction < 0:
			if $Camera2D.offset.x > -100:
				$Camera2D.offset.x -= 2
		else:
			if $Camera2D.offset.x < 100:
				$Camera2D.offset.x += 2
		
		if(!is_in_water):
			
			#gravity
			velocity.y += gravity * delta * gravity_multiplier
			
			#Movement
			if direction:
					velocity.x = direction * speed
			else:
				velocity.x = move_toward(velocity.x, 0, speed)
				
		else:
			#swim Gravity
			velocity.y = clampf(velocity.y + (gravity * delta * swim_gravity), -10000, swim_velocity_cap)
		
			#swim movement
			if direction:
				velocity.x = direction * swim_speed
			else:
				velocity.x = move_toward(velocity.x, 0, swim_speed)
				
		#flip player
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
		
		move_and_slide()
		
		#Animations
		if velocity.x != 0:
			$GFX/AnimationPlayer.play("walk")
		else:
			$GFX/AnimationPlayer.play("idle")
			
	else:
		dead()
	
func dead():
	is_dead = true
	$CollisionShape2D.disabled = true
	$WaterDetection2D/CollisionShape2D.disabled = true
	#TEMPORARY! - change later:
	get_tree().reload_current_scene()
	
		
func _on_water_detection_2d_water_state_changed(is_in_Water : bool):
	self.is_in_water = is_in_Water
	



