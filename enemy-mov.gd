extends CharacterBody2D
@onready var ouchie = $ouchie

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Compare the positions
#var HighScore=50

var player_chase = false
var player = null
var detection_range = 100
@onready var animation = $AnimationPlayer
@onready var score = $Score

var prev_position = Vector2.ZERO
var is_moving = false


var speed = 300;
#use speed of 100




# Define fixed_y_value outside of _physics_process
# Define fixed_y_value outside of _physics_process


var is_dead = false

#scrpt for enemies right of player
func _ready():
	
	print_tree()

#func add_score(amount):
	#HighScore += amount
	#print("High Score: ", HighScore)
	

	
func dead():
	
	is_dead = true
	Autoscript.score += 5
	#$Sprite.texture = load("res://images/grass.png")
	#speed = 0;
	#$AnimatedSprite.play("dead")
	#print("collision detected")
	print("St2")
	queue_free()
	#HighScore = HighScore + 50

	
	#$CollisionShape2D.disable = true;

var fixed_y_value = 100  # Set the desired y-coordinate
func _physics_process(delta):
	#called before every frame
	

	
	if is_dead == true:
		ouchie.play()
	
	if prev_position != position:
		is_moving = true
	else:
		is_moving = false
	
	if is_moving:
		#print("Object is moving")
		animation.play("Move")
	else:
		#print("Object is not moving")
	#
	# Update the previous position for the next frame
		prev_position = position
	
	#velocity.y += gravity * delta
	
	
	
	if is_dead == false:
		
		
		velocity.y += gravity * delta

	
		if player_chase:
			
			var x_movement = Jf.total_movement_x
	
			if global_position.x > x_movement:
				
			# Lock the object's position on the x-axis
				position.y = fixed_y_value
			
			# Calculate movement only along the x-axis
				position -= ((player.position - position) / speed)
			
			else:
				position.y = fixed_y_value
				position += ((player.position - position) / speed)

		#if health > 3:
			#get_tree().change_scene_to_file("res://menu.tscn")

func _on_area_2d_body_entered(body):
	
	player = body
	player_chase = true
	#this is when players enter the range of enemy
	print("Damage taken sir")
	ouchie.play()
	PlayerH.health = PlayerH.health - 1
	

	if PlayerH.health == 0:
		get_tree().change_scene_to_file("res://menu.tscn")
	

func _on_area_2d_body_exited(body):
	player = null
	player_chase = false
