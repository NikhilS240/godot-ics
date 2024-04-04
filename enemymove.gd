extends CharacterBody2D


var speed = 200;
var motion = Vector2()
var grav = 20

var direction = 1; #1 is right and -1 is left


#occurs inf
func _physics_process(delta):
	motion.y += grav
	motion.x += speed * direction
	if is_on_wall():
		#if on wall change side
		direction = direction * -1
