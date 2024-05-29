extends CharacterBody2D


@onready var ouchie = $ouchie
var speed = 100
var min_y = 222
var max_y = 400
var dir = 1
var is_dead = false
var player = null

func _process(delta):
	position.x += speed * dir * delta
	#print(position.x)
	
	if position.x > max_y or position.x < min_y:
		dir *= -1  


func _on_area_2d_body_entered(body):
	player = body
	ouchie.play()
	PlayerH.health = PlayerH.health - 1
	
	if PlayerH.health < 0:
		get_tree().change_scene_to_file("res://menu.tscn")
	
func dead():
	
	is_dead = true
	Autoscript.score += 5
	#$Sprite.texture = load("res://images/grass.png")
	#speed = 0;
	#$AnimatedSprite.play("dead")
	#print("collision detected")
	print("St2")
	queue_free()
	

