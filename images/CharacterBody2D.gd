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

#scrpt for enemies right of player



var fixed_y_value = 100  # Set the desired y-coordinate
func _physics_process(delta):
	#print(player_global)
	
	if player_chase:
		print(position.x)
		if player.position.x > position.x:
			
		# Lock the object's position on the x-axis
			position.y = fixed_y_value
		
		# Calculate movement only along the x-axis
			position.x -= ((player.position.x - position.x) / speed)
			
		else:
			position.x -= ((player.position.x - position.x) / speed)
			
	
		

#reverse the script betwene both







func _on_area_2d_body_entered(body):
	player = body
	player_chase = true


func _on_area_2d_body_exited(body):
	player = null
	player_chase = false
