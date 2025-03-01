extends Node

@onready var video = $MarginContainer/Buttons/TabContainer/Video
@onready var audio = $MarginContainer/Buttons/TabContainer/Audio
@onready var controls = $MarginContainer/Buttons/TabContainer/Controls
var config := ConfigFile.new()


func save():
	print(video.get_child(2))
	
func _ready():
	save()
