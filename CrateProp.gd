extends Sprite2D




func _on_area_2d_body_entered(body):
	PlayerH.health = PlayerH.health + 3
	queue_free()
