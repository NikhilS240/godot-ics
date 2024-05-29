extends StaticBody2D


var is_dead = false

func dead():
	
	is_dead = true
	Autoscript.score = Autoscript.score - 10;

