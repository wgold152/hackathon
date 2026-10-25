extends Furniture

@export var colour : Color
var roomArea : Area2D
var roofArea : Area2D
var roomWindow : Node2D

func _ready() -> void:
	input_event.connect(drag)
	last_position = position
	floorArea = get_tree().get_first_node_in_group("Floor Area")
	roomArea = get_tree().get_first_node_in_group("Room Area")
	roofArea = get_tree().get_first_node_in_group("Roof Area")
	roomWindow = get_tree().get_first_node_in_group("Room Window")


func drag(_viewport, event : InputEvent, _idx) -> void:
	if (event is InputEventMouseButton):
		dragging = event.pressed
		if (!event.pressed):
			if (self in floorArea.get_overlapping_areas()):
				var roomFloor : Sprite2D = roomWindow.get_node("Floor")
				if (roomFloor):
					roomFloor.self_modulate = colour
			elif (self in roofArea.get_overlapping_areas()):
				var roof : Sprite2D = roomWindow.get_node("Roof")
				if (roof):
					roof.self_modulate = colour
			elif (self in roomArea.get_overlapping_areas()):
				roomWindow.self_modulate = colour
			else:
				position = last_position
				return
			queue_free()
			if (has_node("AudioStreamPlayer2D")):
					get_node("AudioStreamPlayer2D").play()
