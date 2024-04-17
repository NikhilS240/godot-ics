### Modified Autoload Script (Jf.gd)
##extends Node
##
##var player_global_x: float = 0.0
##
##func update_player_node(player_node):
	##if player_node:
		### Optionally connect to a custom signal if the node type supports it
		### player_node.connect("position_changed", self, "_on_position_changed")
		##_on_position_changed(player_node.global_position.x)
##
##func _on_position_changed(new_x):
	##player_global_x = new_x
	##emit_signal("player_position_updated", player_global_x)
	##print("Updated player global X position: ", player_global_x)
##
#
#
#
## MovementLogger.gd
extends Node

# Assuming a fixed speed to mimic player movement
var speed = 300.0
var total_movement_x: float = 0  # To accumulate total x movement

func _process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	var movement_change = direction * speed * delta 
	total_movement_x += movement_change 
	
	# Optional: Print out the total movement to verify it's working
	#print("Total X Movement (simulated): ", total_movement_x)
# if i start it 395 to the right then its global pos will be right	
	
#extends Node
#
#var last_x_position: float = 0.0
#
#func _ready():
	#print("Jf ready to log positions.")
#
#func update_global_x_position(new_x):
	#last_x_position = new_x
	#print("Updated global x position: ", last_x_position)
