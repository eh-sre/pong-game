extends Node2D

@export var paddle_speed = 300

func move(delta, direction):
	position.y += paddle_speed*delta*direction
	print(position.y)

func move_random(delta):
	var direction = randi_range(-1, 1)
	var modifier = randi_range(1, 6)
	position.y += paddle_speed*delta*direction*modifier

func move_to_centre(delta):
	position.y = (324)
