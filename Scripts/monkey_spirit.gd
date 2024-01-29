extends Polygon2D


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		$/root/Level/rock.can_pick = true
