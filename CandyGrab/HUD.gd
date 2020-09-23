extends CanvasLayer


func update_score(score):
	$ScoreLabel.text = "Collected: " + str(score)
