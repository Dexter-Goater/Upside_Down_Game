extends CharacterBody2D
var speed = 400  # speed in pixels/sec



func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

func _input(event):
		##If left or right is pressed, it plays the relevant walk animation
	if Input.is_action_just_pressed("left"):
		$AnimatedSprite2D.play("Walking side")
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_just_pressed("right"):
		$AnimatedSprite2D.play("Walking side")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_just_pressed("up"):
		$AnimatedSprite2D.play("Walking up")
	elif Input.is_action_just_pressed("down"):
		$AnimatedSprite2D.play("Walking dow")

		##Plays the idle animation once the left or right button is released
	if Input.is_action_just_released("left") or Input.is_action_just_released("right"):
		$AnimatedSprite2D.play("Idle side")
	elif Input.is_action_just_released("up"):
		$AnimatedSprite2D.play("Idle up")
	elif Input.is_action_just_released("down"):
		$AnimatedSprite2D.play("Idle down")
	
func _ready() -> void:
	self.position.x = Globals.player_x
	self.position.y = Globals.player_y

func _process(delta: float) -> void:
	if Globals.newspapers == 0:
		Globals.day += 1
		get_tree().change_scene_to_file("res://Scenes/day_selector.tscn")

func _on_house_body_entered(body: Node2D) -> void:
	if Globals.house1_visited == false and body.name == "Player":
		Globals.house1_visited = true
		Globals.player_x = self.position.x
		Globals.player_y = self.position.y
		get_tree().change_scene_to_file("res://Scenes/House_inside.tscn")

func _on_house_2_body_entered(body):
	if Globals.house2_visited == false and body.name == "Player":
		Globals.newspapers -= 1
		Globals.house2_visited = true
