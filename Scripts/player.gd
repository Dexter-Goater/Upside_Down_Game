extends CharacterBody2D
var speed = 400  # speed in pixels/sec
@onready var animations = $AnimatedSprite2D
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	updateAnimation()
func updateAnimation():
	if velocity.length() == 0:
		animations.stop()
	else:
		var facing = "down"
		if velocity.x < 0: facing = "left"
		elif velocity.x > 0: facing = "right"
		elif velocity.y < 0: facing = "up"
	
		animations.play("Walking " + facing)
	
func _ready() -> void:
	self.position.x = Globals.player_x
	self.position.y = Globals.player_y

	

func _process(delta: float) -> void:
	pass

func _on_house_body_entered(body: Node2D) -> void:
	if Globals.house1_visited == false and body.name == "Player":
		Globals.house1_visited = true
		Globals.player_x = self.position.x
		Globals.player_y = self.position.y
		get_tree().change_scene_to_file("res://Scenes/House_inside.tscn")
