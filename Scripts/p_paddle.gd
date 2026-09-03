extends "res://scripts/paddle.gd"

# Player paddle movement
func _physics_process(delta):
	if Input.is_action_pressed("w"):
		if (position.y>70):
			move(delta, -1)
	if Input.is_action_pressed("s"):
		if (position.y<576):
			move(delta, 1)
