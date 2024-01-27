extends CharacterBody2D


const UP_DIRECTION = Vector2.UP

@export var SPEED = 550
#@export Var DIRECTION = 0
@export var JUMP_STRENGTH = 1000
@export var GRAVITY = 4500

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


func movement(playerSpeed, delta):
		# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_STRENGTH

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func movement_legacy(velocity, playerSpeed):
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * playerSpeed
		#$AnimatedSprite2D.play() # animaatiot ei toimi jos ne heittää process()
	else:
		#$AnimatedSprite2D.stop()
		pass
		
	position += velocity * get_process_delta_time()
	position = position.clamp(Vector2.ZERO, screen_size) # Prevents the player from leaving 
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process (delta):
	movement(SPEED, delta)
	
	
	pass
