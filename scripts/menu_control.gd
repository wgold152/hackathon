extends Control
@onready var button: Button = $Button
@onready var button_2: Button = $Button2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(initMain)
	# change connect param to "something"
	button_2.pressed.connect(get_tree().quit)

# func "something"()
# get_tree().change_scene_to_file("res://scenes/main.tscn")
# spawn items (instantiate)

func initMain():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	Inventory.DirContents(Inventory.path)
	Inventory.inv = Inventory.PopulateInventory()
	Inventory.InstantiateItems(Inventory.inv)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
