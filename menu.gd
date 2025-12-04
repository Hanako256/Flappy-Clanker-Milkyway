extends CanvasLayer
func _ready():
	$Cursor2.scale = $Start.get_minimum_size()
	$Cursor2.position = $Start.position
