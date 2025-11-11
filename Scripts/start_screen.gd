extends Control


func _on_start_game_button_pressed():
	game.change_current_scene("res://Scenes/main.tscn")


func _on_settings_button_pressed():
	game.change_current_scene("res://Settings/settings.tscn")
	


func _on_help_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	game.quit()
