extends Area2D

const SPEED = 300
var velocity = Vector2()
var direction = 1;

func _ready():
	pass

func set_fireball_direction(dir):
	direction = dir
	if dir == 1:
		pass #throw animated script here
		

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)






func _on_visible_on_screen_notifier_2d_screen_exited(): #stores info in body during coll.
	queue_free()
	




func _on_body_entered(body):
	if "Enemy" in body.name:
		print("this function works! ", body.name)
	body.dead()
	print("function above doesn't work ",body.name)
	queue_free()
