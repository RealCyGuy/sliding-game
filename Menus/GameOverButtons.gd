extends Node2D

func _on_Restart_pressed():
	Global.timePause = false
	Global.time = 0
	get_tree().reload_current_scene()

func _on_Quit_pressed():
	pass # Replace with function body.
