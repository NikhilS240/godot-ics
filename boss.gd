extends CharacterBody2D
 
@onready var ray_cast = $RayCast2D
@onready var player = get_parent().find_child("player")
var count = 20;
var HighScore = 0;

var direction = Vector2.RIGHT
@onready var heal = $HealthLabel
var is_dead = false

var speed = 150
var min_y = -100 
var max_y = 150  
var dir = 1

func _process(delta):
	heal.text = str(count)
	
	
	position.y += speed * dir * delta

	
	if position.y > max_y or position.y < min_y:
		dir *= -1  
	
	
	direction = (player.position - global_position).normalized()
	ray_cast.target_position = direction * 100

	

func dead():
	
	count = count - 1
	
	Autoscript.score += 15
	#print(HighScore)
	if count < 1:
		is_dead = true
		queue_free()
	#$Sprite.texture = load("res://images/grass.png")
	#speed = 0;
	#$AnimatedSprite.play("dead")
	#print("collision detected")
	print("St2")
	
	
	

