extends CharacterBody2D

@export var SPEED = 200

func get_input():
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	

func _physics_process(delta):
	velocity = get_input() * SPEED
	move_and_slide()

