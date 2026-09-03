extends StaticBody2D

@export var paddle_speed = 300

func move(delta, direction):
	position.y += direction*paddle_speed*delta
	
func move_to_centre(delta):
	position.y = move_toward(position.y, 324, paddle_speed*delta)
