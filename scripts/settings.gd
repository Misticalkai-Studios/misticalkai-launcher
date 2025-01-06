extends Control

var moving := false
var mouse_start: Vector2

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")

func _on_accent_header_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			moving = true
			mouse_start = get_viewport().get_mouse_position()
		else:
			moving = false
	elif event is InputEventMouseMotion and moving:
		var mouse_position := get_viewport().get_mouse_position()
		var delta := mouse_position - mouse_start
		get_window().position += Vector2i(delta)
		mouse_start = mouse_position
