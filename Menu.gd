extends Control
@onready var menu = $MarginContainer/Menu
@onready var option = $Options2
@onready var audio = $Audio

func _on_play_pressed():
	get_tree().change_scene_to_file("res://root.tscn")


func _on_options_pressed():
	show_and_hide(option, menu)

func show_and_hide(first, second):
	first.show()
	second.hide()

func _on_exit_pressed():
	get_tree().quit()


func _on_audio_pressed():
	show_and_hide(audio, option)


func _on_back_from_options_pressed():
	show_and_hide(menu, option)


func _on_master_value_changed(value):
	volume(0, value)

func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)


func _on_back_from_audio_pressed():
	show_and_hide(option, audio)
