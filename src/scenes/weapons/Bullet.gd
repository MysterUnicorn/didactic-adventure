extends Area2D

const SPEED = 400

var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # fire()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	position += direction * SPEED * delta

func fire(enemies, player):
	# var enemies = get_tree().get_nodes_in_group("enemy")
	if enemies.size() > 0:
		var closest_enemy = enemies[0]
		var closest_distance = distance_to_player(closest_enemy.position, player)
		for enemy in enemies:
			var enemy_distance = distance_to_player(enemy.position, player)
			if enemy_distance < closest_distance:
				closest_enemy = enemy
				closest_distance = enemy_distance
		direction = closest_enemy.position.normalized() # atan2(closest_enemy.position.y, closest_enemy.position.x)

func distance_to_player(vec: Vector2, player) -> float:
	return vec.distance_to(player.position)
