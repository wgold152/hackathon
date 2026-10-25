extends Area2D

var dragging := false
var old_mouse := Vector2.ZERO
var last_position : Vector2
var floorArea : Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_event.connect(drag)
	last_position = position
	floorArea = get_tree().get_first_node_in_group("Floor Area")

func drag(_viewport, event : InputEvent, _idx) -> void:
	if (event is InputEventMouseButton):
		dragging = event.pressed
		if (!event.pressed):
			if (!self in floorArea.get_overlapping_areas()):
				position = last_position
			else:
				last_position = position
			if (has_node("AudioStreamPlayer2D")):
				get_node("AudioStreamPlayer2D").play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (dragging):
		position += get_viewport().get_mouse_position() - old_mouse;
	old_mouse = get_viewport().get_mouse_position();
