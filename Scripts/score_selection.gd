extends Control

@onready var score_slider = $CenterContainer/VBoxContainer/ScoreSlider
@onready var score_label = $CenterContainer/VBoxContainer/ScoreLabel

func _process(delta):
	score_label.text = "%d" % score_slider.value


func _on_button_button_down():
	game.change_current_scene("res://scenes/main.tscn")
