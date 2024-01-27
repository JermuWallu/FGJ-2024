extends Area2D
signal playerHit

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	print("I touch", body)
	
	if body.has_method("take_damage"):
		body.take_damage()
	pass
	#queue_free()  # Destroy the hitbox when touched

