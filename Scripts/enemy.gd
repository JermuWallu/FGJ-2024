extends RigidBody2D


func take_damage():
	print("enemy took damage")
	Globals.player1_score += 1
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
