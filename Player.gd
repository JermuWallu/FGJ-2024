extends Area2D

@export var speed = 400
var screen_size

'''
TODO:
	Jump logic
	Attack function
		- animation, spawn collision, add damage 

'''


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.


func movement(velocity, playerSpeed):
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * playerSpeed
		$AnimatedSprite2D.play() # animaatiot ei toimi jos ne heittää process()
	else:
		$AnimatedSprite2D.stop()
		
		
	position += velocity * get_process_delta_time()
	position = position.clamp(Vector2.ZERO, screen_size) # Prevents the player from leaving the screen

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	movement(velocity, speed)
	
	

	pass
