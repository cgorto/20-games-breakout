class_name Ball extends CharacterBody2D

@export var speed: float = 600.0


func _ready() -> void:
	velocity = Vector2.UP.rotated(randf_range(0,PI)) * speed

func _physics_process(delta: float) -> void:
	var collision_data: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision_data != null:
		var normal = collision_data.get_normal()
		var reflect_velocity: Vector2 = velocity - 2 * (velocity.dot(normal)) * normal
		var vel_noise: Vector2 = Vector2(randf_range(0.8,1.2),randf_range(0.8,1.2))
		var new_velocity: Vector2 = (reflect_velocity * vel_noise).normalized() * speed
		velocity = new_velocity
		var collider: Object = collision_data.get_collider()
		if collider is Block:
			collider.hit.emit()
