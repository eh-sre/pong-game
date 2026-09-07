extends Node2D

@onready var ball = $Ball
@onready var player_score = $PlayerScore
@onready var opponent_score = $OpponentScore
@onready var player_paddle = $PlayerPaddle
@onready var opponent_paddle = $OpponentPaddle
@onready var start_timer = $StartTimer
@onready var start_label = $StartLabel

func _ready():
	start_timer.start()

func _process(delta):
	if not start_timer.is_stopped():
		start_label.text = "%d" % ceil(start_timer.time_left)

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
	start_label.visible = true

func _on_start_timer_timeout():
	start_label.text = "START"
	ball.start()
	player_paddle.active = true
	opponent_paddle.active = true
	await get_tree().create_timer(1.0).timeout
	start_label.visible = false
