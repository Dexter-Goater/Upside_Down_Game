extends CharacterBody2D
class_name Enemy

var player :Player = null

var speed: float = 100.0
var direction := Vector2.ZERO
func _process(delta):
	if player != null:
		look_at(player.global_position)

func _physics_process(delta):
	if player != null:
		var enemy_to_player = (player.global_position - global_position)
		direction = enemy_to_player.normalized()
		if direction != Vector2.ZERO:
			velocity = speed * direction
		else:
			velocity.x = lerp(velocity.x, 0.0, 0.2)
			velocity.y = lerp(velocity.y, 0.0, 0.2)
		
		move_and_slide()


func _on_player_detector_body_entered(body):
	if body is Player:
		if player == null:
			player = body
			print(name + "found the player")
	

func _on_player_detector_body_exited(body):
	if body is Player:
		if player != null:
			player = null
			print(name + "lost the player")
