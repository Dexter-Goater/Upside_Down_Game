extends CharacterBody2D
class_name Player

signal died



@onready var camera_remote_transform = $CameraRemoteTransform
@onready var shoot_raycast = $ShootRaycast
@onready var anim = $AnimatedSprite2D
var speed = 400.0
var canshoot = true

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	var move_dir = Vector2(Input.get_axis("left", "right"),
	Input.get_axis("up","down"))
	
	if move_dir != Vector2.ZERO:
		velocity = speed * move_dir.normalized()
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.2)
		velocity.y = lerp(velocity.y, 0.0, 0.2)

	if Input.is_action_just_pressed("shoot"):
		if canshoot == true:
			anim.play("Shooting")
			$Timer.start()
		if shoot_raycast.is_colliding():
			var collider = shoot_raycast.get_collider()
			if collider is StaticBody2D:
				print("shot box")
			elif collider is Enemy:
				collider.player = self
				collider.take_damage(1)
	
	move_and_slide()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Enemy:
		died.emit()
		queue_free()


func _on_timer_timeout():
	var canshoot = true
