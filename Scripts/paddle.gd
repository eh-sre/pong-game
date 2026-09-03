extends StaticBody2D

@export var paddle_speed = 300

func move(delta, direction):
	position.y += direction*paddle_speed*delta
	
func move_to_centre(delta):
	if position.y > 324:
		move(delta, -1)
	elif position.y < 324:
		move(delta, 1)
