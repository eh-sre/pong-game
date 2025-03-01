extends Button

const START_SCREEN = preload("res://Scenes/start_screen.tscn")

func _on_pressed():
	game.change_current_scene("res://Scenes/start_screen.tscn")
