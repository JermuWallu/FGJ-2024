extends Node2D
@onready var jump = $jump
@onready var jump2 = $jump2
@onready var kutikuti1 = $kutikuti1
@onready var kutikuti2 = $kutikuti2
@onready var hehe1 = $hehe1
@onready var hehe2 = $hehe2


func play_sound(sound_name):
	for child in get_children():
		if child.name == sound_name:
			child.play()
			break
	
