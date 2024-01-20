extends Control

var paused = false

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	paused = false
	$AnimationPlayer.play_backwards("blur")
	print("t")
	$Panel/resume.disabled = true
	$Panel/quit_out.disabled = true
	
func pause():
	get_tree().paused = true
	paused = true
	print("f")
	$AnimationPlayer.play("blur")
	$Panel/resume.disabled = false
	$Panel/quit_out.disabled = false
	
func testEsc():
	if Input.is_action_pressed("esc") and paused == false:
		pause()
		
func _on_resume_pressed():
	resume()

func _on_quit_out_pressed():
	get_tree().quit()
	
func _process(delta):
	testEsc()
