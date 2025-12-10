extends CanvasLayer
var scaler = 1
var up = true

func _ready():
	if (!DisplayServer.is_touchscreen_available()):
		get_tree().change_scene_to_file("res://menu.tscn")
		
func _process(delta):
	if $TouchScreenButton.is_pressed():
		get_tree().change_scene_to_file("main")
	

func _on_scale_up_timeout() -> void:
	$TouchScreenButton.scale = Vector2(scaler, scaler)
	if (scaler > 1.15):
		up = false
	if (scaler < 1):
		up = true
	if (up == true):
		scaler = scaler + 0.002
	if (up == false):
		scaler = scaler - 0.002
