extends KinematicBody2D


const GRAVITY = 220
const SLIDE_SPEED = 100
const JUMP_SPEED = 130

var velocity = Vector2()
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var direction = right
var levelNumber = 0
onready var levels = get_parent().get_node("Checkpoints").get_child_count()
onready var levelNumberLabel = get_node("GridSnapper/Camera2D/Control/LevelNumber")
onready var jumpBuffer = get_node("JumpBuffer")

func _ready():
	incrementLevel()

func _physics_process(delta):
	if Global.move:
		velocity.y += delta * GRAVITY
		
		velocity.x = direction.x * SLIDE_SPEED
			
		velocity = move_and_slide(velocity, Vector2(0, -1))
		if is_on_floor():
			$CPUParticles2D.modulate.a = 1
			if Input.is_action_pressed("jump") || !jumpBuffer.is_stopped():
				jumpBuffer.stop()
				velocity.y = -JUMP_SPEED
				$AudioStreamPlayer2D.play()
		else:
			if Input.is_action_pressed("jump"):
				jumpBuffer.start()
			$CPUParticles2D.modulate.a = 0.01
			
		if is_on_wall():
			if direction == left:
				direction = right
				get_node("AnimatedSprite").set_flip_h(false)
			elif direction == right:
				direction = left
				get_node("AnimatedSprite").set_flip_h(true)
			
func incrementLevel():
	levelNumber += 1
	levelNumberLabel.text = "Level: %s/%s" % [levelNumber, levels]
