extends Label

signal score_changed(new_score: int)

var score: int = 0
func add_point():
	score += 1
	text = str(score)
	score_changed.emit(score)
