extends Node2D

var block_scene := preload("res://block.tscn")

@export_group("Game Properties")
@export var colors: PackedColorArray

const HOR_PADDING := 20
const VERT_PADDING := 10

func spawn_blocks()-> void:
	var block_size := Block.get_block_size();

	var viewport_size_width: int = floor(get_viewport_rect().size.x)
	
	var num_columns := (viewport_size_width-(HOR_PADDING*2)) / (block_size.x+HOR_PADDING)
	var col_leftover_padding = (viewport_size_width-(HOR_PADDING*2)) % (block_size.x+HOR_PADDING)
	var num_rows := colors.size() * 2

	for c in range(num_columns):
		for r in range(num_rows):
			var block := block_scene.instantiate() as Block;
			block.set_block_color(colors[r/2])
			block.global_position.x = HOR_PADDING + col_leftover_padding + block_size.x*0.5 + (c * (block_size.x+HOR_PADDING))
			block.global_position.y = HOR_PADDING + block_size.y*0.5 + (r * (block_size.y+VERT_PADDING))
			add_child(block)

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_blocks()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
