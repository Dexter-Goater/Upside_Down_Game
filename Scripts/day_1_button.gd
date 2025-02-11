extends Button



func _on_pressed() -> void:
	if Globals.day == 1:
		get_tree().change_scene_to_file("res://Scenes/Scene.tscn")
