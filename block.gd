extends Area2D
class_name Block

static func get_block_size()-> Vector2i:
	return Vector2i(160, 16)

func set_block_color(color:Color) -> void:
	$Quad.color = color

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
