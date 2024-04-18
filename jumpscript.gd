extends CharacterBody2D

@export var speed = 300
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

	if Input.is_action_just_pressed("jump"):
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

	if Input.is_action_pressed("jump") and jump_time < max_jump_time and jumps > 0:
		velocity.y = -jump_force
		jump_time += delta

	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * horizontal_direction
	move_and_slide()

	print(velocity)
