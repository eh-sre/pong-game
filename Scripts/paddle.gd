extends CharacterBody2D

@export var paddle_speed = 300
var bounce: int = 0
var active: bool = false

func move(delta, direction):
	position.y += direction*paddle_speed*delta
	
func move_to_centre(delta):
	position.y = move_toward(position.y, 324, paddle_speed*delta)

func reset():
	position.y = 324
	active = false
