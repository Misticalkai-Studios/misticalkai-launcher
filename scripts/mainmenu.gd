extends Control

var moving := false
var mouse_start: Vector2

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_minimize_button_pressed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MINIMIZED)

func _on_accent_gui_input(event: InputEvent) -> void:
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
