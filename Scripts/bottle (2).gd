extends Sprite2D

func _on_area_2d_body_entered(body):
	print("d")
	if body.name == "Player":
		$Polygon2D.visible = true
		$Label.visible = true

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		$Polygon2D.visible = false
		$Label.visible = false
