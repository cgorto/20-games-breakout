extends Label

func _ready() -> void:
	GameManager.score_changed.connect(on_score_changed)
	
func on_score_changed(new_score: int) -> void:
	text = str(new_score)
