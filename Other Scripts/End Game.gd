extends Area2D

onready var tilemap = get_parent().get_node("TileMap")

func _on_End_Game_body_entered(body):
	if body.name == "Player":
		Global.timePause = true
		tilemap.set_cell(-4, 15, 0)
		tilemap.set_cell(-3, 15, 0)
		tilemap.set_cell(-3, 14, 0)
		tilemap.update_bitmask_region(Vector2(-4, 13), Vector2(-2, 16))
	
