extends Node2D

@export var ball_speed = 300
signal hit
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_area_2d_body_entered(body):
	if body == get_parent().get_node("PlayerPaddle") or body == get_parent().get_node("OpponentPaddle"):
		hit.emit()
