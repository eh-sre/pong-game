extends Node2D

@onready var ball = $Ball
@onready var player_score = $PlayerScore
@onready var opponent_score = $OpponentScore
@onready var player_paddle = $PlayerPaddle
@onready var opponent_paddle = $OpponentPaddle
@onready var start_timer = $StartTimer

func _ready():
	start_timer.start()

func _on_ball_out_of_bounds():
	if ball.position.x < 0:
		opponent_score.add_point()
	elif ball.position.x > get_viewport().size.x:
		player_score.add_point()
	
	reset()

func reset():
	ball.reset()
	player_paddle.reset()
	opponent_paddle.reset()
	start_timer.start()
	

func _on_start_timer_timeout():
	print("Hello")
