extends Node2D

signal playerHit

var hitbox_scene = preload("res://Scenes/hitbox.tscn")
var hitbox_instance

func spawn_hitbox():
	hitbox_instance = hitbox_scene.instance()
	add_child(hitbox_instance)
	print(hitbox_instance)
	pass
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	hitbox_scene = preload("res://Scenes/hitbox.tscn")
	pass # Replace with function body.
	
func _on_body_entered(body):
	playerHit.emit()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_pressed("attack"):
	#	spawn_hitbox()
	pass
