extends AudioStreamPlayer

var music = load("res://assets/Music/bg_music.mp3")

func _ready():
	stream = music
	play()
