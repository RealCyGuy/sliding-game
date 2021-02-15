extends Node2D

func _on_Restart_pressed():
	Global.loadLevel()

func _on_Quit_pressed():
	get_tree().change_scene("res://Menus/Menu.tscn")
