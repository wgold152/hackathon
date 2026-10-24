extends Area2D

var dragging := false
var old_mouse := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_event.connect(drag)


func drag(_viewport, event : InputEvent, _idx) -> void:
	if (event is InputEventMouseButton):
		dragging = event.pressed
		if (!event.pressed and has_node("AudioStreamPlayer2D")):
			get_node("AudioStreamPlayer2D").play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (dragging):
		position += get_viewport().get_mouse_position() - old_mouse;
	old_mouse = get_viewport().get_mouse_position();
