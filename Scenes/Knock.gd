extends Area2D

var dialogue_resource : DialogueResource
var dialogue_start : String = "start"
# Called when the node enters the scene tree for the first time.
func action():
	DialogueManager.show_example_dialogue_balloon(dialogue_resource , dialogue_start)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
