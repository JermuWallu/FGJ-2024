extends Control
var has_choice = false


func _on_play_p_2_pressed():
	if !has_choice:
		has_choice = true
		$ButtonSound.play()
		await get_tree().create_timer(0.1).timeout
		
		$controls_sprite.visible = true
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://Scenes/vsPlayer.tscn") # tähän kahden pelaajan versio


func _on_play_cpu_pressed():
	if !has_choice:
		has_choice = true
		$ButtonSound.play()
		await get_tree().create_timer(0.1).timeout
		get_tree().change_scene_to_file("res://Scenes/main.tscn") # tähän konetta vastaan versio


func _on_back_pressed():
	if !has_choice:
		has_choice = true
		$ButtonSound.play()
		await get_tree().create_timer(0.1).timeout
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
