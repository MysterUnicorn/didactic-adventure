extends Node2D

@export var timer: Timer
const BULLET = preload("res://src/scenes/weapons/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timeout.connect(_on_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timeout():
	var enemies = get_tree().get_nodes_in_group("enemy")
	var player = get_tree().get_first_node_in_group("player")
	var bullet = BULLET.instantiate()
	bullet.fire(enemies, player)
	add_child(bullet)
