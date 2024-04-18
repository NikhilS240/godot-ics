extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Compare the positions


var player_chase = false
var player = null
var detection_range = 100


var speed = 300;
#use speed of 100

# Define fixed_y_value outside of _physics_process
# Define fixed_y_value outside of _physics_process


var is_dead = false

#scrpt for enemies right of player
func _ready():
	print_tree()

	
func dead():
	is_dead = true
	#$Sprite.texture = load("res://images/grass.png")
	#speed = 0;
	#$AnimatedSprite.play("dead")
	#print("collision detected")
	print("St2")
	queue_free()
	
	#$CollisionShape2D.disable = true;

var fixed_y_value = 100  # Set the desired y-coordinate
func _physics_process(delta):
	if is_dead == false:
	
		#print("sf")
	
		if player_chase:
			var x_movement = Jf.total_movement_x
			#print("Accessed Total X Movement from Jfe: ", x_movement)
			#print(global_position.x, "enemy ")
			if global_position.x > x_movement:
				
			# Lock the object's position on the x-axis
				position.y = fixed_y_value
			
			# Calculate movement only along the x-axis
				position -= ((player.position - position) / speed)
				#print("WE ARE AXTIVE")
			else:
				position.y = fixed_y_value
				position += ((player.position - position) / speed)



#reverse the script betwene both



func _on_area_2d_body_entered(body):
	player = body
	player_chase = true


func _on_area_2d_body_exited(body):
	player = null
	player_chase = false
