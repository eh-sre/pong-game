extends Node

@onready var audio_stream_player = $Node/AudioStreamPlayer
var music = preload("res://assets/Music/bg_music.mp3")

func _ready():
	print(music)
	print(audio_stream_player)

func _on_music_button_pressed():
	audio_stream_player.stream = music
	audio_stream_player.play()


func _on_sfx_button_pressed():
	#audio_stream_player.stream = POWERUP
	audio_stream_player.play()


func _on_child_entered_tree(node):
	print(node)
