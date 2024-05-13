#extends CharacterBody2D
#
#
#const SPEED = 300.0
#const JUMP_VELOCITY = -1000
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
	#
	
	
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_up") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
	
	
	
	#khalils beyond this point!!!!!!!!!!!!!!!!!!
	
	
	
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
var jumps = 0
var jump_time = 0
var coyote_time = 0
var jump_buffer_time = 0

const FIREBALL = preload("res://bullet.tscn")
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



	# Add the gravity.
	
	########var x_movement = Jf.total_movement_x
	

	#print(position, "hi")
	#print("Accessed Total X Movement from Jf: ", x_movement)
	

func _physics_process(delta):
	var on_floor = is_on_floor()
	
	
	

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
		var fireball = FIREBALL.instantiate()
		#if sign($Marker2D.position.x) == 1:
			#fireball.set_fireball_direction(1)
		#else:
			#fireball.set_fireball_direction(-1)
		get_parent().add_child(fireball)
		fireball.position = $Marker2D.global_position




	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#


	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		#if sign($Marker2D.position.x) == -1:
			#$Marker2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
	#animation.play("idle")
		velocity.x = -speed
		#if sign($Marker2D.position.x) == 1:
			#$Marker2D.position.x *= -1
	else:
		velocity.x = 0
		
	move_and_slide()
#
#
#extends CharacterBody2D
#
#@export var speed = 300
#@export var gravity = 25
#@export var jump_force = 500
#@export var max_jump_time = 0.2
#@export var max_jumps = 2
#@export var coyote_time_duration = 0.1
#@export var jump_buffer_duration = 0.1
#var jumps = 0
#var jump_time = 0
#var coyote_time = 0
#var jump_buffer_time = 0
#
#func _physics_process(delta):
	#var on_floor = is_on_floor()
	#
	#if on_floor:
		#coyote_time = coyote_time_duration
		#jumps = 0
	#
	#if not on_floor:
		#if coyote_time > 0:
			#coyote_time -= delta
		#velocity.y += gravity
		#if velocity.y > 500:
			#velocity.y = 500
#
	#if Input.is_action_just_pressed("jump"):
		#if on_floor or coyote_time > 0:
			#velocity.y = -jump_force
			#jumps += 1
			#jump_time = 0
		#else:
			#jump_buffer_time = jump_buffer_duration
#
	#if jump_buffer_time > 0:
		#jump_buffer_time -= delta
		#if on_floor:
			#velocity.y = -jump_force
			#jumps += 1
			#jump_time = 0
			#jump_buffer_time = 0  # Clear buffer since the jump has been executed
#
	#if Input.is_action_pressed("jump") and jump_time < max_jump_time and jumps > 0:
		#velocity.y = -jump_force
		#jump_time += delta
#

