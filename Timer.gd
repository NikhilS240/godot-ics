extends Timer

# Duration a button press can last to still be considered a tap
var tap_duration = 0.2  # 200 milliseconds
var can_shoot = true  # Control flag to enable shooting

func _ready():
	wait_time = tap_duration
	one_shot = true  # Timer does not repeat automatically
	stop()  # Ensure the timer is stopped at start

func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		if can_shoot:
			start_shooting()
			start()  # Start timing the press duration

	elif Input.is_action_just_released("ui_down"):
		stop_shooting()
		stop()  # Stop and reset the timer

func start_shooting():
	if can_shoot:
		print("Shooting started")  # Replace this with actual shooting logic

func stop_shooting():
	can_shoot = false  # Disable shooting until the next valid tap
	print("Shooting stopped")  # Optional, for debugging

func _on_timeout():
	# Timer completes indicating the button was held too long to be a valid tap
	stop_shooting()
	print("Held too long, shooting disabled until next tap")  # For debugging

func _input(event):
	if event.is_action_released("ui_down"):
		can_shoot = true  # Re-enable shooting on button release
