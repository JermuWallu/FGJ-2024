extends Control

func _on_play_pressed():
	$ButtonSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/option.tscn")

func _on_quit_game_pressed():
	$ButtonSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()




