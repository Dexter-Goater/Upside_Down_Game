extends Button



func _on_pressed() -> void:
	if Globals.day == 1:
		Globals.player_x = 0
		Globals.player_y = 0
		get_tree().change_scene_to_file("res://Scenes/Scene.tscn")
