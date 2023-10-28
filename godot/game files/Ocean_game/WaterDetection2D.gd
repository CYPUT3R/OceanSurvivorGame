extends Area2D

signal water_state_changed(is_in_Water : bool)

var is_in_Water : bool = false

func _on_body_entered(body):
	
	if (is_in_Water == false):
		var overlapping_bodies = get_overlapping_bodies()
	
		if (overlapping_bodies.size() >= 1):
			is_in_Water = true
			emit_signal("water_state_changed", is_in_Water)

func _on_body_exited(body):
	var overlapping_bodies = get_overlapping_bodies()
	
	if (overlapping_bodies.size() == 0):
		is_in_Water = false
		emit_signal("water_state_changed", is_in_Water)
