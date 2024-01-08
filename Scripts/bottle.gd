extends Sprite2D

var has_upgrade = false

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		$Polygon2D.visible = true
		$Label.visible = true
		$/root/MainGame/Label6.visible = true
		
		$/root/MainGame/Label.visible = false
		$/root/MainGame/Label2.visible = false
		$/root/MainGame/Label3.visible = false
		$/root/MainGame/Label4.visible = false
		$/root/MainGame/Label5.visible = false
		
		
		if has_upgrade == false:
			$/root/MainGame/Level/Rock.can_pick = true
			has_upgrade = true
			
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		$Polygon2D.visible = false
		$Label.visible = false
