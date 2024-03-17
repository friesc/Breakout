extends CharacterBody2D

@onready var collisionShape = $CollisionShape

const SPEED: float = 450.0

func _physics_process(_delta):
	var direction = Input.get_axis("PaddleLeft", "PaddleRight")

	velocity.x = direction * SPEED

	move_and_slide()

	var viewport_size = get_viewport_rect().size

	var collision_half_width = collisionShape.shape.get_rect().size.x / 2.0

	if global_position.x - collision_half_width < 0:
		global_position.x = collision_half_width
	elif global_position.x + collision_half_width > viewport_size.x:
		global_position.x = viewport_size.x - collision_half_width
