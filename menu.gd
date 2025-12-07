extends CanvasLayer
var index = 0

func _ready():
	$Cursor2.scale = $Start.get_minimum_size()
	$Cursor2.position = $Start.position
	$input_frequency.visible = false
	$show_colors.visible = false

func _process(delta):
	var buttons = [$Start, $Settings, $Controls]
	var text = ["", "block spawn frequency:\nblock moving speed:\nplayer speed:\nfont color 0-9:\nfont color 10-19:\nfont color 20-49\n font color 50-99\nfont color 100+", "KEYBOARD\nW/SPACE - Switch vertical direction\nS - Hover for 0.5 seconds\nEnter - Restart game\n\nCONTROLLER\nX - Switch vertical direction\nLB - Hover for 0.5 seconds\nRT - Restart game"]
	var x = buttons[index]
	if Input.is_action_just_pressed("menu_down"):
		if(index < 2):
			index = index + 1
		else:
			index = 0
		
	if Input.is_action_just_pressed("menu_up"):
		if  (index > 0):
			index = index - 1
		else:
			index = 2
	
	if Input.is_action_just_pressed("menu_select"):
		$Display.text = text[index]
		if (index == 0):
			get_tree().change_scene_to_file("res://main.tscn")
		if (index == 1):
			$input_frequency.visible = true
			$show_colors.visible = true
		else:
			$input_frequency.visible = false
			$show_colors.visible = false
	$Cursor2.scale = x.get_minimum_size()
	$Cursor2.position = x.position
	
