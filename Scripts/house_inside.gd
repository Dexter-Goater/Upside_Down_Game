extends Node2D
# Called when the node enters the scene tree for the first time.

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/Button.show()
	Dialogic.signal_event.connect(_on_dialogic_signal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$AnimatedSprite2D.play("default")
	$Control/Button.hide()
	if Globals.day == 1:
		Dialogic.start("timeline")
	if Globals.day == 2:
		Dialogic.start("Day_2")

func _on_dialogic_signal(argument: String):
	if argument == "Leave":
		$AnimatedSprite2D.play("Closing")
		$Timer.start()
		Globals.newspapers -= 1
			


func _on_timer_timeout() -> void:
	if Globals.newspapers == 0:
		Globals.day += 1
		get_tree().change_scene_to_file("res://Scenes/day_selector.tscn")
	elif Globals.day == 1:
		get_tree().change_scene_to_file("res://Scenes/Scene.tscn")
	elif Globals.day == 2:
		get_tree().change_scene_to_file("res://Scenes/Day_2.tscn")
	
