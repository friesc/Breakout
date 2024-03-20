extends RigidBody2D
class_name Ball

@export_range(0, 100, 0.2) var radius: float
@onready var collisionshape := $CollisionShape

# Called when the node enters the scene tree for the first time.
func _ready():
	collisionshape.shape.radius = radius
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	queue_redraw()

func _draw():
	draw_circle(Vector2.ZERO, radius, Color.WHITE)
	draw_arc(Vector2.ZERO, radius, 0.0, 2*PI, 50, Color.DARK_GRAY, 1, true)
