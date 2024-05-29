#new one
extends CharacterBody2D

var speed = 100
var min_y = 300
var max_y = 420
var dir = 1

func _process(delta):
	position.x += speed * dir * delta
	print(position.x)
	
	if position.x > max_y or position.x < min_y:
		dir *= -1  

