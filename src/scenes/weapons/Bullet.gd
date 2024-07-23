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
	
func fire(direction):
	self.direction = direction

