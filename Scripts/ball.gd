extends Node2D

@export var ball_speed = 300
signal hit
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_area_2d_area_entered(area):
	hit.emit()
