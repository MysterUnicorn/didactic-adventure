extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")

const SPEED = 150.0
var HEALTH = 20.0

func move():
	var enemy_direction = player.get_position() - position
	var normalized_direction = enemy_direction.normalized()
	velocity = normalized_direction * SPEED 
	move_and_slide()

func _physics_process(delta):	
	move()

func take_damage(amount):
	HEALTH -= amount
	if HEALTH <= 0:
		queue_free()

