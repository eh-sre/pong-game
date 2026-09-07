extends Control

@onready var score_slider = $CenterContainer/VBoxContainer/ScoreSlider
@onready var score_label = $CenterContainer/VBoxContainer/ScoreLabel

func _on_button_button_down():
	game.max_score = score_slider.value
	game.change_current_scene("res://scenes/main.tscn")

func _on_score_slider_value_changed(value):
	score_label.text = "%d" % value
