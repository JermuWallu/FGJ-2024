extends CharacterBody2D

var screen_size

const UP_DIRECTION = Vector2.UP
@export var SPEED = 700

@export var JUMP_STRENGTH = 1500
@export var GRAVITY = 4500

var attack_hitbox
var timer

var hp = 10;


'''
TODO:
	Attack function
		- animation, spawn collision, add damage 

'''


func movement(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_STRENGTH

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	pass
	
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

func animations():
	if $AnimatedSprite2D.get_animation() == "hit":
		pass
	if velocity != Vector2.ZERO:
		$AnimatedSprite2D.stop()
	else:
		$AnimatedSprite2D.play("idle")
	pass

func take_damage():
	print("player took damage")
	pass

func attack():
	$AnimatedSprite2D.play("attack")
	
	$Timer.start()
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	attack_hitbox = $hitbox
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process (delta):
	movement(delta)
	animations()
	if Input.is_action_pressed("attack"):
		attack()
	pass
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.play("hit")
	
	hp -= 1
	if hp == 0:
		pass #TODO: death logic
	pass 

func _on_timer_timeout():
	pass
