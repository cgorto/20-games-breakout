class_name BlockGrid extends Node2D

@export var grid_size: Vector2i = Vector2i(16,8)
@export var block_scene: PackedScene
@export_range(0.0,1.0,0.01) var vertical_limit: float = 0.7

var block_container: Array[Array]

func _ready() -> void:
	for i in grid_size.y:
		var block_array: Array[Block] = []
		for j in grid_size.x:
			var new_block: Block = block_scene.instantiate()
			block_array.append(new_block)
		block_container.append(block_array)
	create_grid()

func create_grid() -> void:
	var screen_size: Vector2 = get_viewport_rect().size
	screen_size *= Vector2(1.0, vertical_limit)
	var block_size: Vector2 = Vector2(screen_size.x / grid_size.x, screen_size.y / grid_size.y)
	var half_block_size: Vector2 = block_size / 2
	for i in grid_size.y:
		for j in grid_size.x:
			var block_pos: Vector2 = Vector2(j * block_size.x + half_block_size.x, i * block_size.y + half_block_size.y)
			block_container[i][j].set_size(block_size)
			block_container[i][j].position = block_pos
			block_container[i][j].set_value(randi_range(1,4))
			add_child(block_container[i][j])
