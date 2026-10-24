extends TextureButton

@export var furniture : PackedScene
@export var price := 300
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(purchase)

func purchase() -> void:
	if (player.money >= price):
		
