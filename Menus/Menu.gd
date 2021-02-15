extends Control

func _process(delta):
	if Input.is_action_just_pressed("space"):
		Global.loadLevel()

func _on_Button_pressed():
	Global.loadLevel()
