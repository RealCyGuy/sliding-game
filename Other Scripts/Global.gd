extends Node

var time = 0
var timeString = ""
var timePause = false

func _process(delta):
	if !timePause:
		time += delta
		timeString = formatTime(time)
	
func formatTime(time):
	var mins = time / 60
	var secs = int(time) % 60
	var ms = int((time * 1000 / 10)) % 100
	
	return "%02d:%02d.%02d" % [mins, secs, ms]
