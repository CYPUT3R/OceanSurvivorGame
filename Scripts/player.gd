extends CharacterBody2D

@export var acc = 1
@export var speed = 50
@export var jump_velocity = -1200
@export var swim_jump : float = -40
@export var gravity_multiplier = 3
@export var swim_gravity : float = 0.4
@export var swim_velocity_cap : float = 150
@export var swim_speed : float = 500
@export var max_speed : float = 10000
@export var swim_down_speed : float = 400

var time = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_in_water : bool = false
var is_dead : bool = false

@onready var jump_timer = $Jump_timer
@onready var coyote_timer = $Coyote_timer
@onready var camera = $/root/MainGame/Camera2D
@onready var animator = $GFX/AnimationPlayer

func _physics_process(delta):
	if is_dead == false:
		
		
		#Recieve input
		var direction = Input.get_axis("ui_left", "ui_right")
		
		control_camera(delta, direction)
		
		if(!is_in_water):
			#gravity
			velocity.y += gravity * delta * gravity_multiplier
			
			movement(delta)
			
		else:
			#swim Gravity
			velocity.y = clampf(velocity.y + (gravity * delta * swim_gravity), -10000, swim_velocity_cap)
		
			swim_movement(delta, direction)
		
		flip(direction)
		
		jump()
		
		var was_on_floor = is_on_floor()
		
		move_and_slide()
		
		#coyote time
		if was_on_floor && !is_on_floor():
			jump_timer.start()
		
	else:
		dead()
		if Input.is_action_pressed("ui_interact"):
			get_tree().reload_current_scene()
	
func flip(direction):
	if direction:
			if direction < 0:
				$GFX.flip_h = true
			else:
				$GFX.flip_h = false 
	
func swim_movement(delta, direction):
	#swim movement
	if direction:
		animator.play("walk")
		velocity.x = direction * swim_speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y = swim_down_speed
	else:
		animator.play("idle")
		velocity.x = move_toward(velocity.x, 0, swim_speed)
	
func movement(delta):
	if Input.is_action_pressed("ui_left"):
		animator.play("walk")
		if acc > 0:
			acc = -200
		elif acc >= -600:
			acc -= delta * 1000

		velocity.x = acc
		
	elif Input.is_action_pressed("ui_right"):
		animator.play("walk") 
		if acc < 0:
			acc = 200
		elif acc <= 600:
			acc += delta * 1000

		velocity.x = acc
	else:
		animator.play("idle")
		velocity.x = lerp(velocity.x, 0.0, 0.2)
	
func control_camera(delta, direction):
		if direction < 0:
			if camera.offset.x > -100:
				camera.offset.x -= 2
		elif direction > 0:
			if camera.offset.x < 100:
				camera.offset.x += 2
		
		if camera.global_position != self.global_position:
			camera.global_position = self.global_position
	
func jump():
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor() and is_in_water == false:
			velocity.y = jump_velocity
			
	if Input.is_action_pressed("ui_accept") && is_in_water == true:
		velocity.y = swim_jump
		
	if Input.is_action_just_released("ui_accept") && velocity.y < 0:
		velocity.y = 0
	
func dead():
	is_dead = true
	$walk_collision.disabled = true
	$WaterDetection2D/CollisionShape2D.disabled = true
	$/root/MainGame/CanvasLayer/Control/death_screen.visible = true
	
func _on_water_detection_2d_water_state_changed(is_in_Water : bool):
	self.is_in_water = is_in_Water
	
