extends Node

@export var player: Node2D

const MIN_SPAWN_DISTANCE_OFFSET = 50
const MAX_SPAWN_DISTANCE_OFFSET = 150

@onready var rng = RandomNumberGenerator.new()
@onready var timer = get_node("Timer")
@onready var enemy = preload("res://src/scenes/enemies/EnemyTest.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timeout.connect(_on_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_screen_limits() -> Vector2:
	var screen_rect = get_viewport().get_visible_rect().size
	return screen_rect

func set_spawn_location() -> Vector2:
	# Get to viewport distance
	var screen_limits_in_pixels = get_screen_limits()
	var screen_limits_in_game_distance = screen_limits_in_pixels / player.get_node("Camera2D").zoom.x
	var distance = ((screen_limits_in_game_distance.x/2)**2 + (screen_limits_in_game_distance.y/2)**2)**(1.0/2.0)
	# Set enemy spawn position
	var enemy_distance = rng.randf_range(distance + MIN_SPAWN_DISTANCE_OFFSET, distance + MAX_SPAWN_DISTANCE_OFFSET)
	var enemy_angle = rng.randf_range(0, 360)
	var enemy_relative_position = Vector2(cos(enemy_angle), sin(enemy_angle)) * enemy_distance
	return enemy_relative_position + player.position

func _on_timeout():
	var instance = enemy.instantiate()
	instance.position = set_spawn_location()
	add_child(instance)
	print(len(self.get_children()))
