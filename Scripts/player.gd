extends CharacterBody2D
var speed = 400  # speed in pixels/sec
var newspapers = 1


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

	move_and_slide()
	
func _ready() -> void:
	Globals.house1_visited = false

func _process(delta: float) -> void:
	if newspapers == 0:
		Globals.day += 1
		get_tree().change_scene_to_file("res://Scenes/day_selector.tscn")

func _on_house_body_entered(body: Node2D) -> void:
	if Globals.house1_visited == false:
		newspapers -= 1
		Globals.house1_visited = true
	
	
