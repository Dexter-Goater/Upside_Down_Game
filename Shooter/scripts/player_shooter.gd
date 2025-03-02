extends CharacterBody2D
var speed = 300.0
	
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
