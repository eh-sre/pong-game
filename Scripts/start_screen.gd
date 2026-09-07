extends Control


func _on_start_game_button_pressed():
	game.change_current_scene("res://scenes/score_selection.tscn")


func _on_settings_button_pressed():
	game.change_current_scene("res://settings/settings.tscn")
	


func _on_help_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	game.quit()
