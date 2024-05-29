extends Area2D

var min_value = 455
var max_value = 1000
var speed = randi() % (max_value - min_value + 1) + min_value


var direction = Vector2.RIGHT

func _physics_process(delta):
	position += direction * speed * delta




func _on_screen_exited():
	queue_free()


func _on_body_entered(body):
	print("Hit detected!")
	print(body.name)
	if "player" in body.name:
		PlayerH.health = PlayerH.health - 1
		print("Itworks!!!!!")

	if PlayerH.health == 0:
			get_tree().change_scene_to_file("res://menu.tscn")
