extends Area2D

const SPEED = 500
var velocity = Vector2()
func _ready():

	pass


func _physics_process(delta):
	velocity.x = SPEED * delta
	translate(velocity)






func _on_visible_on_screen_notifier_2d_screen_exited(): #stores info in body during coll.
	queue_free()
	





func _on_body_entered(body):
	if "enemy" in body.name:
		body.dead()
	queue_free()
