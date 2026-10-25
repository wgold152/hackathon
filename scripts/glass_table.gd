extends Furniture

func drag(_viewport, event : InputEvent, _idx) -> void:
	if (event is InputEventMouseButton):
		dragging = event.pressed
		if (!event.pressed):
			if (!ground in floorArea.get_overlapping_areas()):
				position = last_position
			else:
				queue_free()
				if (has_node("AudioStreamPlayer2D")):
					var streamer : AudioStreamPlayer2D = get_node("AudioStreamPlayer2D")
					streamer.play()
					streamer.reparent(get_parent())
					streamer.finished.connect(streamer.queue_free)
