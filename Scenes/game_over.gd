extends Control



func _on_yes_button_pressed():
	game.change_current_scene("res://scenes/score_selection.tscn")


func _on_no_button_pressed():
	game.change_current_scene("res://scenes/start_screen.tscn")
