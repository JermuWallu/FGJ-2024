extends Area2D
var is_in_body = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.monitorable = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	is_in_body = true
	while is_in_body:
		#print("I touch ", body)

		if body.has_method("take_damage"):
			body.take_damage()
		pass
		await get_tree().create_timer(0.1).timeout
	self.monitoring = false  # disables hits after finding one hit



func _on_body_exited(body):
	is_in_body = false
	pass # Replace with function body.
