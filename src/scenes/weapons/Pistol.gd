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
	
	var target = get_closest_enemy(enemies, player)
	if target != null:
		var fire_direction = get_enemie_s_direction(target, player)
		
		var bullet = BULLET.instantiate()
		bullet.rotate(PI/2 + fire_direction.angle())
		bullet.fire(fire_direction)
		
		add_child(bullet)

func get_closest_enemy(enemies, player):
	var player_position = player.global_position
	var closest_enemy = null
	var closest_enemy_distance = INF
	for enemy in enemies:
		var distance = enemy.global_position.distance_to(player_position)
		if distance < closest_enemy_distance:
			closest_enemy = enemy
			closest_enemy_distance = distance
	return closest_enemy
	
func get_enemie_s_direction(enemy, player):
		return (enemy.global_position - player.global_position).normalized()

