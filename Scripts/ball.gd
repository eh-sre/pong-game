extends CharacterBody2D

@export var ball_speed: float = 300
signal out_of_bounds

func start():
	var direction: int = [-1, 1].pick_random()
	var vertical_direction: float = randf_range(-1, 1)
	velocity = Vector2(direction, vertical_direction).normalized() * ball_speed

# Ball movement
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)

	if collision:
		var collider = collision.get_collider()

		# Bounce
		velocity = velocity.bounce(collision.get_normal())

		# Paddle collisions
		if collider.is_in_group("paddles"):
			collider.bounce += 1
			velocity *= 1.05
			var hit_offset: float = position.y - collider.position.y
			var angle: float = deg_to_rad(clamp(hit_offset / 10, -45, 45))
			velocity = velocity.rotated(angle)

		# Wall collisions
		if collider.is_in_group("walls"):
			velocity *= 1.005
			var speed: float = velocity.length()
			var horizontal_direction: int = sign(velocity.x)
			var angle: float = atan2(velocity.y, abs(velocity.x))+deg_to_rad([-20, -30, -10, 0, 10, 30, 20].pick_random())
			angle = clamp(angle, deg_to_rad(-60), deg_to_rad(60))
			velocity.x = horizontal_direction * speed * cos(angle)
			velocity.y = speed * sin(angle)

	# Score
	if position.x < 0 or position.x > get_viewport().size.x:
		out_of_bounds.emit()

func reset():
	position = get_viewport().size / 2
	velocity = Vector2.ZERO
