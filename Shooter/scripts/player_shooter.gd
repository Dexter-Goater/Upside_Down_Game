extends CharacterBody2D

signal died

@onready var camera_remote_transform = $CameraRemoteTransform

var speed = 400.0

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	var move_dir = Vector2(Input.get_axis("left", "right"),
	Input.get_axis("up","down"))
	
	if move_dir != Vector2.ZERO:
		velocity = speed * move_dir.normalized()
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.2)
		velocity.y = lerp(velocity.y, 0.0, 0.2)
	
	
	move_and_slide()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Enemy:
		died.emit()
		queue_free()
