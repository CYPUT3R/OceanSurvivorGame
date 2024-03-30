extends AudioStreamPlayer

var can_play = false
var random : bool = false
var _playing = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if random == true and playing == false:
		playing = true
		_playing = true
		print(playing)
		$Timer.wait_time = 20

func _on_timer_timeout():
	if can_play == true and _playing == false:
		if randi() % 2:
			random = true
	$Timer.start()

func _on_finished():
	_playing = false
	can_play = false
