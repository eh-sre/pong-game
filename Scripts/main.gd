extends Node2D

@onready var ball = $Ball
@onready var player_score = $PlayerScore
@onready var opponent_score = $OpponentScore


func _ready():
	ball.hit.connect(_on_ball_hit)
	ball.out_of_bounds.connect(_on_ball_out_of_bounds)


func _on_ball_hit():
	pass


func _on_ball_out_of_bounds():
	if ball.position.x < 0:
		opponent_score.add_point()
	elif ball.position.x > get_viewport().size.x:
		player_score.add_point()

	reset_ball()


func reset_ball():
	ball.reset()
