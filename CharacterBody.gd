
extends CharacterBody2D

@export var speed = 300
const SPEED = 300.0
const JUMP_VELOCITY = -1000
@export var gravity = 25
@export var jump_force = 500
@export var max_jump_time = 0.2
@export var max_jumps = 2
@export var coyote_time_duration = 0.1
@export var jump_buffer_duration = 0.1
@onready var animation = $AnimationPlayer
var jumps = 0
var jump_time = 0
var coyote_time = 0
var jump_buffer_time = 0

var prev_position = Vector2.ZERO
var is_moving = false

const FIREBALL = preload("res://bullet.tscn")
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dead = false


	# Add the gravity.
	
	########var x_movement = Jf.total_movement_x
	

	#print(position, "hi")
	#print("Accessed Total X Movement from Jf: ", x_movement)
	

func _physics_process(delta):
	var on_floor = is_on_floor()

	if prev_position != position:
		is_moving = true
	else:
		is_moving = false
	
	#if is_moving:
		#print("Object is moving")
		#animation.play("Shootmove")
	

	if on_floor:
		coyote_time = coyote_time_duration
		jumps = 0
	
	if not on_floor:
		if coyote_time > 0:
			coyote_time -= delta
		velocity.y += gravity
		if velocity.y > 500:
			velocity.y = 500
	
	

	if Input.is_action_just_pressed("ui_up"):
		print("jump")
		animation.play("Jump", -1, 1.5);
		if on_floor or coyote_time > 0:
			velocity.y = -jump_force
			jumps += 1
			jump_time = 0
		else:
			jump_buffer_time = jump_buffer_duration

	if jump_buffer_time > 0:
		jump_buffer_time -= delta
		if on_floor:
			velocity.y = -jump_force
			jumps += 1
			jump_time = 0
			jump_buffer_time = 0  # Clear buffer since the jump has been executed

	if Input.is_action_pressed("ui_up") and jump_time < max_jump_time and jumps > 0:
		velocity.y = -jump_force
		jump_time += delta

	if Input.is_action_just_pressed("ui_down"):
		print("shoot")
		animation.play("Shoot", -1, 1.5);
		var fireball = FIREBALL.instantiate()
		#if sign($Marker2D.position.x) == 1:
			#fireball.set_fireball_direction(1)
		#else:
			#fireball.set_fireball_direction(-1)
		get_parent().add_child(fireball)
		fireball.position = $Marker2D.global_position


#
	if (Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right")) && Input.is_action_pressed("ui_down"):
		animation.play("shootmove")
		print("shootmove")
		
	elif (Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left")):
		animation.play("Walk", -1, 1.5)

	
	if Input.is_action_pressed("ui_right"):
		print("walk")
		velocity.x = speed
		#if sign($Marker2D.position.x) == -1:
			#$Marker2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		print("walk")
	#animation.play("idle")
		velocity.x = -speed
		#if sign($Marker2D.position.x) == 1:
			#$Marker2D.position.x *= -1
	else:
		velocity.x = 0
		
	move_and_slide()
#
