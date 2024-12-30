class_name Block extends StaticBody2D

signal hit

var value: int = 1
var size: Vector2i = Vector2i(32,32)

@export_group("Child References")
@export var collision_shape: CollisionShape2D
@export var control: Control
@export var label: Label

func _ready() -> void:
	hit.connect(on_hit)
	hit.connect(GameManager.on_block_hit)
	update_label()
	
func set_size(new_size: Vector2i) -> void:
	size = new_size
	(collision_shape.shape as RectangleShape2D).size = size
	var half_size = size / 2
	control.offset_left = - half_size.x
	control.offset_top = - half_size.y
	control.offset_right = half_size.x
	control.offset_bottom = half_size.y
	control.position = - half_size

func set_value(new_value: int) -> void:
	value = new_value

func update_label() -> void:
	label.text = str(value)

func on_hit() -> void:
	value -= 1
	print("yippee")
	update_label()
	if value < 1:
		queue_free()
