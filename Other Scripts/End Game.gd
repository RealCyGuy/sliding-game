extends Area2D

onready var tilemap = get_parent().get_node("TileMap")
export(Array, NodePath) var scoreLabels


func save_scores(content):
	var file = File.new()
	file.open("user://leaderboard.dat", File.WRITE)
	file.store_var(content)
	file.close()


func load_scores():
	var file = File.new()
	var content = []
	if file.file_exists("user://leaderboard.dat"):
		file.open("user://leaderboard.dat", File.READ)
		content = file.get_var()
		file.close()
	return content


func _on_End_Game_body_entered(body):
	if body.name == "Player":
		Global.timePause = true
		tilemap.set_cell(-4, 15, 0)
		tilemap.set_cell(-3, 15, 0)
		tilemap.set_cell(-3, 14, 0)
		tilemap.update_bitmask_region(Vector2(-4, 13), Vector2(-2, 16))
		var scores = load_scores()
		scores.append(Global.time)
		scores.sort()
		save_scores(scores)
		var index = 0
		for label in scoreLabels:
			print(scores)
			var richLabel = get_node(label)
			var score = 0
			if scores.size() > index:
				score = scores[index]
			index += 1
			richLabel.bbcode_text = "[center]" + str(index) + ": " + Global.formatTime(score) + "[/center]"
