extends Control

func _on_RestartButton_meta_clicked(meta):
	Global.timePause = false
	Global.time = 0
	get_tree().reload_current_scene()


func _on_RestartButton_meta_hover_started(meta):
	get_node("RestartButton").add_color_override("default_color", Color(0.25, 0.25, 0.25, 1))


func _on_RestartButton_meta_hover_ended(meta):
	get_node("RestartButton").add_color_override("default_color", Color(0, 0, 0, 1))


func _on_QuitButton_meta_clicked(meta):
	pass # Replace with function body.


func _on_QuitButton_meta_hover_started(meta):
	pass # Replace with function body.


func _on_QuitButton_meta_hover_ended(meta):
	pass # Replace with function body.
