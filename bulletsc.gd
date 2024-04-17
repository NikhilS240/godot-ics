extends Area2D

const SPEED = 500
var velocity = Vector2()
func _ready():

	pass


func _physics_process(delta):
	velocity.x = SPEED * delta
	translate(velocity)




func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
