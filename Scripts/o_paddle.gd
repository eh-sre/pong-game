extends "res://scripts/paddle.gd"

@onready var ball = $"../Ball"
# Opponent paddle movement (simple AI)
func _physics_process(delta):
	if ball.position.x > 576 and abs(position.y-ball.position.y)>70:
		if (ball.position.y > position.y) and (position.y<576):
			move(delta, 1)
		if (ball.position.y < position.y) and (position.y>70):
			move(delta, -1)
	elif position.y>70 and position.y<576:
			move_to_centre(delta)
