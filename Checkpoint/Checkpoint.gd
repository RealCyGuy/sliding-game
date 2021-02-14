extends StaticBody2D

var passedCheckpoint = false

func _on_Area2D_body_exited(body):
	if body.name == "Player" and !passedCheckpoint:
		passedCheckpoint = true
		body.incrementLevel()
