extends Button



func _on_pressed() -> void:
	if Globals.day == 1:
		Globals.player_x = 0
		Globals.player_y = 0
		Globals.house1_visited = false
		Globals.house2_visited = false
		get_tree().change_scene_to_file("res://Scenes/Scene.tscn")


func _on_day_2_button_pressed():
	if Globals.day == 2:
		Globals.player_x = 0
		Globals.player_y = 0
		Globals.house1_visited = false
		Globals.house2_visited = false
		get_tree().change_scene_to_file("res://Scenes/Day_2.tscn")
