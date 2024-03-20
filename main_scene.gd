extends Node2D



@export_group("Game Properties")
@export var colors: PackedColorArray
@export var paddle: PackedScene
@export var ball: PackedScene
@export var block: PackedScene

const HOR_PADDING := 20
const VERT_PADDING := 10

@onready var paddleSpawnPosition = $PaddleSpawnPosition
@onready var ballSpawnPosition = $BallSpawnPosition

func spawn_paddle()-> void:
	var paddle_instance := paddle.instantiate() as Paddle;
	paddle_instance.global_position = paddleSpawnPosition.global_position
	add_child(paddle_instance)

func spawn_ball()-> void:
	var ball_instance := ball.instantiate() as Ball;
	ball_instance.global_position = ballSpawnPosition.global_position
	add_child(ball_instance)
	
func spawn_blocks()-> void:
	var block_size := Block.get_block_size();

	var viewport_size_width: int = floor(get_viewport_rect().size.x)
	
	var num_columns := (viewport_size_width-(HOR_PADDING*2)) / (block_size.x+HOR_PADDING)
	var col_leftover_padding = (viewport_size_width-(HOR_PADDING*2)) % (block_size.x+HOR_PADDING)
	var num_rows := colors.size() * 2

	for c in range(num_columns):
		for r in range(num_rows):
			var block_instance := block.instantiate() as Block;
			block_instance.set_block_color(colors[r/2])
			block_instance.global_position.x = HOR_PADDING + col_leftover_padding*0.5 + block_size.x*0.5 + (c * (block_size.x+HOR_PADDING))
			block_instance.global_position.y = HOR_PADDING + block_size.y*0.5 + (r * (block_size.y+VERT_PADDING))
			add_child(block_instance)

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_paddle()
	spawn_ball()
	spawn_blocks()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
