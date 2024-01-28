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

#@onready var hitboxNode = preload("res://Scripts/hitbox.gd") 
#@onready var hitboxScene = preload("res://Scenes/hitbox.tscn") 
var hitbox 
@onready var hitbox_timer = $hitbox/hitbox_timer

@onready var player_is_attacking = false
@onready var attack_timer = $AnimationTree/attack_timer

@onready var player_is_hit = false
@onready var hit_timer = $AnimationTree/hit_timer

@onready var animation_tree : AnimationTree = $AnimationTree

@onready var audio = $audios

func movement(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		audio.play_sound("jump")	
		velocity.y = -JUMP_STRENGTH

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	position = position.clamp(Vector2.ZERO, screen_size)
	pass


func take_damage():
	if !player_is_hit:
		print("player took damage")
		player_is_hit = true
		hit_timer.start(.6)
		Globals.player2_score +=1
		audio.play_sound("hehe1")	
	else:
		print("hit time is on!")
	pass


func attack():
	print("player is attacking!")
	player_is_attacking = true
	$AnimationTree/attack_timer.start()
	audio.play_sound("kutikuti1")	
	hitbox_timer.start(.2)
	hitbox.monitoring = true
	pass


func update_animation_parameters():
	if player_is_attacking:
		animation_tree["parameters/conditions/is_attacking"] = true
	else:
		animation_tree["parameters/conditions/is_attacking"] = false
		
	if player_is_hit:
		animation_tree["parameters/conditions/is_hit"] = true
	else:
		animation_tree["parameters/conditions/is_hit"] = false
	pass
	
	if (velocity.length() == 0):
		animation_tree["parameters/conditions/is_idle"] = true
		animation_tree["parameters/conditions/is_walking"] = false
	else:
		animation_tree["parameters/conditions/is_idle"] = false
		animation_tree["parameters/conditions/is_walking"] = true
		
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	animation_tree.active = true
	
	hitbox = $hitbox
	hitbox.monitoring = false
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process (delta):
	movement(delta)
	
	if Input.is_action_pressed("attack"):
		if attack_timer.is_stopped():
			attack()
		else:
			#print("theres a delay in attacking, time left: ",attack_timer.time_left)
			pass
		
	update_animation_parameters() # this should also work in _physics_process
	pass 


func _on_hit_timer_timeout():
	print("hit timer has ended!")
	player_is_hit = false
	pass # Replace with function body.


func _on_attack_timer_timeout():
	print("attack timer has ended!")
	player_is_attacking = false
	pass # Replace with function body.


func _on_hitbox_timer_timeout():
	print("HITOX TIMER ENDS")
	hitbox.monitoring = false
	pass # Replace with function body.
