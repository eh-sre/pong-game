extends CharacterBody2D

@export var ball_speed = 300
signal hit
signal out_of_bounds

func _ready():
	velocity = Vector2(ball_speed, 150)

# Ball movement
func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	if collision:
		var collider = collision.get_collider()
		# Paddle collisions
		if collider.is_in_group("paddles"):
			hit.emit()
		velocity = velocity.bounce(collision.get_normal())
	
	# Score
	if position.x < 0 or position.x > get_viewport().size.x:
		out_of_bounds.emit()

func reset():
	velocity = Vector2(ball_speed, 150)
	position = get_viewport().size/2
