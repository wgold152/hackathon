extends Control
@onready var button: Button = $Button
@onready var button_2: Button = $Button2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(get_tree().change_scene_to_file.bind("res://scenes/main.tscn"))
	# change connect param to "something"
	button_2.pressed.connect(get_tree().quit)

# func "something"()
# get_tree().change_scene_to_file("res://scenes/main.tscn")
# spawn items (instantiate)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
