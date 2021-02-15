extends Control

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene("res://Menus/Menu.tscn")	

func _on_Button_pressed():
	get_tree().change_scene("res://Menus/Menu.tscn")
