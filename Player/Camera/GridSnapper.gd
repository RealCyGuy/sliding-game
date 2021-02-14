extends Node2D

var grid_position = Vector2()
var grid_size = Vector2()

onready var parent = get_parent()

func _ready():
	$Camera2D.position = Vector2()
	grid_size = get_viewport_rect().size
	set_as_toplevel(true)
	update_grid_position()
	jump_to_grid_position()


func _physics_process(delta):
	update_grid_position()


func update_grid_position():
	var new_grid_position = calculate_grid_position()
	if grid_position == new_grid_position:
		return
	grid_position = new_grid_position
	jump_to_grid_position()


func calculate_grid_position():
	var x = round(parent.position.x / grid_size.x)
	var y = round(parent.position.y / grid_size.y)
	return Vector2(x, y)


func jump_to_grid_position():
	position = Vector2(grid_position * grid_size)
