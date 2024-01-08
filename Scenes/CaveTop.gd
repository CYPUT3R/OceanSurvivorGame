extends Sprite2D

var fading = false
var fading_out = false

func _ready():
	self.visible = true

func _process(delta):
	if fading == true && self.modulate.a > 0:
		self.modulate.a -= 0.03
		$PointLight2D.color.a -= 0.03
		
	if fading_out == true && self.modulate.a <= 1:
		self.modulate.a += 0.03
		$PointLight2D.color.a += 0.03
	
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		fading = true
		fading_out = false

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		fading_out = true
		fading = false
