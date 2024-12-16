extends Label

var score = 0

func _on_mob_squashed() -> void:
	score += 1
	text = "Score: %s" % score


func _on_score_increase() -> void:
	score += 1
	text = "Score: %s" % score


func _on_score_reset() -> void:
	score = 0
