#extends CharacterBody2D
#
##@onready var animation = $AnimationPlayer
#@export var speed = 300
#@export var jump_height = -400
#
#const FIREBALL = preload("res://bullet.tscn")
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
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = jump_height
#
#
#
	#if Input.is_action_pressed("shoot"):
		#var fireball = FIREBALL.instantiate()
		#get_parent().add_child(fireball)
		#fireball.position = $Marker2D.global_position
#
#
#
## Get the input direction and handle the movement/deceleration.
## As good practice, you should replace UI actions with custom gameplay actions.
		#var direction = Input.get_axis("ui_left", "ui_right")
		#if direction:
			#velocity.x = direction * speed
#
		#else:
##animation.play("idle")
			#velocity.x = move_toward(velocity.x, 0, speed)
#
			#move_and_slide()
#
#
#
#



#new beyond this point



extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const FIREBALL = preload("res://bullet.tscn")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	
	########var x_movement = Jf.total_movement_x
	
	
	#print(position, "hi")
	#print("Accessed Total X Movement from Jf: ", x_movement)
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("ui_down"):
		var fireball = FIREBALL.instantiate()
		get_parent().add_child(fireball)
		fireball.position = $Marker2D.global_position

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()






