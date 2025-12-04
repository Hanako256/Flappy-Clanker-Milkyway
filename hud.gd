extends CanvasLayer
func update_score(score):
	$ScoreLabel.text = str(score)


func _on_hover_button_pressed() -> void:
	Input.action_press("hover")


func _on_switch_button_pressed() -> void:
	Input.action_press("switch")


func _on_restart_button_released() -> void:
	Input.action_press("restart")
