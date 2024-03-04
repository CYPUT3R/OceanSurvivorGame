extends CharacterBody2D

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		$Label.visible = true
		
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		$Label.visible = false
		
