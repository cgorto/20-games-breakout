class_name PlayerPaddle extends Node2D

@export var movement_speed: float = 10.0

@export var paddle: CharacterBody2D

@export_group("PID Parameters")
@export var p: float = 1.0
@export var i: float = 1.0
@export var d: float = 1.0

@onready var movement_pid: PID = PID.new(p,i,d)

func _physics_process(delta: float) -> void:
	var mouse_pos: Vector2 = get_mouse_pos()
	var difference: float = (paddle.global_position.x / get_viewport_rect().size.x) - mouse_pos.x
	var movement_strength: float = movement_pid.update(0, difference, delta)
	paddle.velocity = movement_strength * movement_speed * Vector2.RIGHT
	paddle.move_and_slide()

func get_mouse_pos() -> Vector2:
	return get_viewport().get_mouse_position() / get_viewport_rect().size
