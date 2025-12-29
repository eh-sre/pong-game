extends Node2D

var ball_direction = Vector2(0, 1)
@onready var o_paddle = $OpponentPaddle
@onready var p_paddle = $PlayerPaddle
@onready var ball = $Ball
var ball_speed
var paddle_speed

func _ready():
	ball_speed = ball.ball_speed
	paddle_speed = p_paddle.paddle_speed

func _process(delta):
	# Ball movement
	ball.position += ball_direction * ball_speed * delta

	# Player paddle movement
	if Input.is_action_pressed("w"):
		p_paddle.position.y -= paddle_speed * delta
	if Input.is_action_pressed("s"):
		p_paddle.position.y += paddle_speed * delta

	# Opponent paddle movement (simple AI)
	if ball.position.y > o_paddle.position.y:
		o_paddle.position.y += paddle_speed * delta
	if ball.position.y < o_paddle.position.y:
		o_paddle.position.y -= paddle_speed * delta

	# Wall collisions
	if ball.position.y < 0 or ball.position.y > get_viewport().size.y:
		ball_direction.y = -ball_direction.y

	# Paddle collisions
	if ball.get_node("Area2D").overlaps_body(p_paddle.get_node("Area2D")) or ball.get_node("Area2D").overlaps_body(o_paddle.get_node("Area2D")):
		ball_direction.x = -ball_direction.x

	# Score
	if ball.position.x < 0:
		$OpponentScore.text = str(int($OpponentScore.text) + 1)
		reset_ball()
	if ball.position.x > get_viewport().size.x:
		$PlayerScore.text = str(int($PlayerScore.text) + 1)
		reset_ball()

func reset_ball():
	ball.position = get_viewport().size / 2
	ball_direction = Vector2(-1, 0)
