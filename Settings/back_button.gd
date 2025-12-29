extends Button

const START_SCREEN = preload("res://Scenes/start_screen.tscn")
var config = ConfigFile.new()
const SETTINGS_PATH = "user://settings.cfg"

func _on_pressed():
	game.change_current_scene("res://Scenes/start_screen.tscn")
	
	
