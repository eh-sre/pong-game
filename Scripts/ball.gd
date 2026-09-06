extends CharacterBody2D

@export var ball_speed = 300
signal out_of_bounds

func _ready():
	var direction = [-1, 1].pick_random()
	var vertical_direction = randf_range(-1, 1)
	velocity = Vector2(direction, vertical_direction).normalized()*ball_speed

# Ball movement
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)

	if collision:
		print(velocity.y)
		var collider = collision.get_collider()

		# Bounce
		velocity = velocity.bounce(collision.get_normal())

		# Paddle collisions
		if collider.is_in_group("paddles"):
			velocity *= 1.05
			var hit_offset = position.y - collider.position.y
			var angle = deg_to_rad(clamp(hit_offset / 10, -45, 45))
			velocity = velocity.rotated(angle)

		# Wall collisions
		if collider.is_in_group("walls"):
			velocity *= 1.005
			var angle = velocity.angle()
			var horizontal_direction = sign(velocity.x)
			if horizontal_direction > 0:
				angle = clamp(angle, deg_to_rad(-60), deg_to_rad(60))
			else:
				angle = clamp(angle, deg_to_rad(120), deg_to_rad(240))
			velocity = Vector2.from_angle(angle) * velocity.length()

	# Score
	if position.x < 0 or position.x > get_viewport().size.x:
		out_of_bounds.emit()

func rotate_ball(angle):
	velocity = velocity.rotated(deg_to_rad(angle))
	

func reset():
	var direction = [-1, 1].pick_random()
	var vertical_direction = randf_range(-1, 1)
	velocity = Vector2(direction, vertical_direction).normalized() * ball_speed
	position = get_viewport().size / 2
