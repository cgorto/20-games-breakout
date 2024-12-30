class_name BorderColliders extends Node2D

@export var wall_width: float = 20.0

@export_group("Border Toggles")
@export var top: bool = true
@export var left: bool = true
@export var right: bool = true
@export var bottom: bool = false

@export_group("Node References")
@export var top_collider: CollisionShape2D
@export var left_collider: CollisionShape2D
@export var right_collider: CollisionShape2D
@export var bottom_collider: CollisionShape2D

func _ready() -> void:
	var screen_size: Vector2 = get_viewport_rect().size
	if top:
		top_collider.disabled = false
		var top_pos: Vector2 = Vector2(screen_size.x, 0 - wall_width) / 2
		top_collider.global_position = top_pos
		(top_collider.shape as RectangleShape2D).size = Vector2(screen_size.x * 1.1, wall_width)
	if left:
		left_collider.disabled = false
		var left_pos: Vector2 = Vector2(0 - wall_width, screen_size.y) / 2
		left_collider.global_position = left_pos
		(left_collider.shape as RectangleShape2D).size = Vector2(wall_width,screen_size.y * 1.1)
	if right:
		right_collider.disabled = false
		var right_pos: Vector2 = Vector2(screen_size.x + (wall_width / 2), screen_size.y / 2)
		right_collider.global_position = right_pos
		(right_collider.shape as RectangleShape2D).size = Vector2(wall_width,screen_size.y * 1.1)
	if bottom:
		bottom_collider.disabled = false
		var bottom_pos: Vector2 = Vector2(screen_size.x / 2, screen_size.y + (wall_width / 2))
		bottom_collider.global_position = bottom_pos
		(bottom_collider.shape as RectangleShape2D).size = Vector2(screen_size.x * 1.1,wall_width)
