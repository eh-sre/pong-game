extends Node2D

var ball_speed = 300
var paddle_speed = 300
var ball_direction = Vector2(-1, 0)

func _ready():
	pass

func _process(delta):
	# Ball movement
	$Ball.position += ball_direction * ball_speed * delta

	# Player paddle movement
	if Input.is_action_pressed("ui_up"):
		$PlayerPaddle.position.y -= paddle_speed * delta
	if Input.is_action_pressed("ui_down"):
		$PlayerPaddle.position.y += paddle_speed * delta

	# Opponent paddle movement (simple AI)
	if $Ball.position.y > $OpponentPaddle.position.y:
		$OpponentPaddle.position.y += paddle_speed * delta
	if $Ball.position.y < $OpponentPaddle.position.y:
		$OpponentPaddle.position.y -= paddle_speed * delta

	# Wall collisions
	if $Ball.position.y < 0 or $Ball.position.y > get_viewport().size.y:
		ball_direction.y = -ball_direction.y

	# Paddle collisions
	if $Ball.get_node("Area2D").overlaps_body($PlayerPaddle) or $Ball.get_node("Area2D").overlaps_body($OpponentPaddle):
		ball_direction.x = -ball_direction.x

	# Score
	if $Ball.position.x < 0:
		$OpponentScore.text = str(int($OpponentScore.text) + 1)
		reset_ball()
	if $Ball.position.x > get_viewport().size.x:
		$PlayerScore.text = str(int($PlayerScore.text) + 1)
		reset_ball()

func reset_ball():
	$Ball.position = get_viewport().size / 2
	ball_direction = Vector2(-1, 0)
