extends CharacterBody2D

enum STATE {
	IDLE,
	WALKING,
	HIT,
	ATTACKING
}

var screen_size

const UP_DIRECTION = Vector2.UP
@export var SPEED = 700

@export var JUMP_STRENGTH = 1500
@export var GRAVITY = 4500

var attack_hitbox
var attack_timer

var anim_state
var anim_timer

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
	
	# Animation handling
	if !anim_timer.is_stopped():
		if velocity.length() > 0:
			anim_state = STATE.WALKING
		else:
			anim_state = STATE.IDLE
		
	move_and_slide()
	pass

func take_damage():
	print("player took damage")
	anim_timer.stop()
	anim_state = STATE.HIT
	$AnimatedSprite2D.play("hit")
	pass

func attack():
	anim_state = STATE.ATTACKING
	pass

func animations():
	if anim_state == STATE.HIT:
		print("anim_state")
	if anim_timer.is_stopped():
		if anim_state == STATE.IDLE:
			$AnimatedSprite2D.play("idle")
		elif anim_state == STATE.WALKING:
			$AnimatedSprite2D.play("walk")
		elif anim_state == STATE.HIT: # EI TOIMI
			$AnimatedSprite2D.play("hit")
			anim_timer.set_wait_time(0.5)
		elif anim_state == STATE.ATTACKING:
			$AnimatedSprite2D.play("attack")
			anim_timer.set_wait_time(0.5)

		pass

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	attack_hitbox = $hitbox #TODO: fix
	anim_timer = $AnimatedSprite2D/Timer
	anim_state = STATE.IDLE
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process (delta):
	movement(delta)
	
	if Input.is_action_pressed("attack"):
		attack()
		

	animations()

	pass 
