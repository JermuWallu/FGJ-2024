extends Control

func _on_play_again_pressed():
	$ButtonSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_credits_pressed():
	$ButtonSound.play()
	await get_tree().create_timer(0.1).timeout
	# add a credits screen here

func _on_quit_pressed():
	$ButtonSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()
