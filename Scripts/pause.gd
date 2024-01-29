extends Control

var paused = false

@onready var options_menu = $options_menu as OptionsMenu
@onready var panel = $Panel as Panel

func _ready():
	$AnimationPlayer.play("RESET")
	options_menu.exit_options_menu.connect(on_exit_options_menu)

func on_exit_options_menu() -> void:
	panel.visible = true
	options_menu.visible = false

func resume():
	get_tree().paused = false
	paused = false
	$AnimationPlayer.play_backwards("blur")
	print("t")
	$Panel/resume.disabled = true
	$Panel/quit_out.disabled = true
	$Panel/options.disabled = true
	
func pause():
	get_tree().paused = true
	paused = true
	print("f")
	$AnimationPlayer.play("blur")
	$Panel/resume.disabled = false
	$Panel/quit_out.disabled = false
	$Panel/options.disabled = false
	
func testEsc():
	if Input.is_action_pressed("esc") and paused == false:
		pause()
		
func _on_resume_pressed():
	resume()

func _on_quit_out_pressed():
	get_tree().quit()
	
func _process(delta):
	testEsc()

func _on_options_pressed():
	panel.visible = false
	options_menu.set_process(true)
	options_menu.visible = true
