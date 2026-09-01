extends Node2D

var x_direction = -1
var ball_direction = Vector2(x_direction, -1)
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
		if (p_paddle.position.y>70):
			p_paddle.move(delta, -1)
	if Input.is_action_pressed("s"):
		if (p_paddle.position.y<576):
			p_paddle.move(delta, 1)

	# Opponent paddle movement (simple AI)
	if ball.position.x > 576 && abs(o_paddle.position.y-ball.position.y)>70:
		if (ball.position.y > o_paddle.position.y) && (o_paddle.position.y<576):
			o_paddle.move(delta, 1)
		if (ball.position.y < o_paddle.position.y) && (o_paddle.position.y>70):
			o_paddle.move(delta, -1)
	elif (o_paddle.position.y>70 && o_paddle.position.y<576):
			o_paddle.move_to_centre(delta)
	# Wall collisions
	if ball.position.y < 0 or ball.position.y > get_viewport().size.y:
		ball_direction.y = -ball_direction.y
		print(ball_direction)
		

	# Paddle collisions

	# Score
	if ball.position.x < 0:
		$OpponentScore.text = str(int($OpponentScore.text) + 1)
		reset_ball()
	if ball.position.x > get_viewport().size.x:
		$PlayerScore.text = str(int($PlayerScore.text) + 1)
		reset_ball()

func reset_ball():
	ball.position = get_viewport().size / 2
	ball_speed=350
	x_direction = -floor(x_direction)
	ball_direction = Vector2(x_direction, -1)


func _on_ball_hit():
	x_direction = -x_direction
	ball_direction.x = -ball_direction.x-0.1
	print(ball_speed)


func _on_ball_speed_timer_timeout():
	ball_speed*=1.1
