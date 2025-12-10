extends CanvasLayer
var index = 0
@export var set_block_frequency = 0.8
@export var set_block_speed = 300
@export var set_player_velocity = 300

func _ready():
	$Cursor2.scale = $Start.get_minimum_size()
	$Cursor2.position = $Start.position
	$input_frequency.visible = false
	$show_colors.visible = false
	if (DisplayServer.is_touchscreen_available()):
		get_tree().change_scene_to_file("res://mobile_menu.tscn")

func _process(delta):
	var buttons = [$Start, $Controls]
	var text = ["", "KEYBOARD\nW/SPACE - Switch vertical direction\nS - Hover for 0.5 seconds\nEnter - Restart game\n\nCONTROLLER\nX - Switch vertical direction\nLB - Hover for 0.5 seconds\nRT - Restart game"]
	var x = buttons[index]
	if Input.is_action_just_pressed("menu_down"):
		if(index < 1):
			index = index + 1
		else:
			index = 0
		
	if Input.is_action_just_pressed("menu_up"):
		if  (index > 0):
			index = index - 1
		else:
			index = 1
	
	if Input.is_action_just_pressed("menu_select"):
		$Display.text = text[index]
		if (index == 0):
			get_tree().change_scene_to_file("res://main.tscn")
		#if (index == 1):
			#$input_frequency.visible = true
			#$show_colors.visible = true
		#else:
			#$input_frequency.visible = false
			#$show_colors.visible = false
	
	if (index == 1):
		set_block_frequency = $input_frequency.text
		set_block_speed = $input_frequency/input_block_speed.text
		set_player_velocity = $input_frequency/input_player_speed.text
	
	if Input.is_key_pressed(KEY_X):
		print(set_block_frequency, "\n", set_block_speed, "\n", set_player_velocity)
	$Cursor2.scale = x.get_minimum_size()
	$Cursor2.position = x.position
	
