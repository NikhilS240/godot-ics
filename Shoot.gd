extends State
class_name ShootState

@export var bullete_node : PackedScene 
@onready var timer = $Timer

func transition():
	if not ray_cast.is_colliding():
		get_parent().change_state("Follow")

func enter():
	super.enter()
	timer.start()
	
func exit():
	super.exit()
	timer.stop()

func _on_timer_timeout():
	shoot()
	
func shoot():
	var bullete = bullete_node.instantiate()
 
	bullete.position = global_position
	bullete.direction = (player.global_position - global_position).normalized()
 
	get_tree().current_scene.call_deferred("add_child",bullete)
