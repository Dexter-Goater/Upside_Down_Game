extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/Button.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$AnimatedSprite2D.play("default")
	$Control/Button.hide()
