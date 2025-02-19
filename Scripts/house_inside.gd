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
	Dialogic.start("timeline")

func _on_dialogic_signal(argument: String):
	if argument == "Leave":
		$AnimatedSprite2D.play("Closing")
		$Timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/Scene.tscn")
	Globals.newspapers -= 1
	
