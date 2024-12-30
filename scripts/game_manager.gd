extends Node

signal score_changed(new_score: int)

var score: int = 0

func on_block_hit() -> void:
	score += 1
	score_changed.emit(score)
