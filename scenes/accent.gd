extends Panel

var dragging = false
var drag_offset = Vector2()
var window

func _ready():
	window = get_window()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			drag_offset = get_global_mouse_position() - window.position.vector2
		else:
			dragging = false

func _process(delta):
	if dragging:
		window.position = (get_global_mouse_position() - drag_offset).to_vector2i()
