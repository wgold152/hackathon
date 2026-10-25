extends Node

static var furnishings = []
static var furnitureStore = []
static var inv = []
static var instances = []

var path = 'res://scenes/furniture/'

func DirContents(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
				
			else:
				print("Found file: " + file_name)
				furnitureStore.append(load(path + file_name))
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")

static func PopulateInventory() -> Array:
	var temp
	var i = 0
	var inventory = []
	
	#reset inventory
	inventory.clear()
	inventory.resize(8)
	
	while i < 8:
		temp = furnitureStore.pick_random()
		
		#prevents duplicate furniture
		if not inventory.has(temp):
			inventory[i] = temp
			i = i + 1
			print(str(temp) + "Added to inventory")
			
	return inventory

func InstantiateItems(inventory):
	var xincrement = 211
	var yincrement = 174
	var basePositionx = 655
	var basePositiony = 787
	var inventoryVectors = [Vector2(basePositionx, basePositiony), 
						Vector2(basePositionx+xincrement, basePositiony),
						Vector2(basePositionx+(2*xincrement), basePositiony),
						Vector2(basePositionx+(3*xincrement), basePositiony),
						Vector2(basePositionx, basePositiony+yincrement),
						Vector2(basePositionx+xincrement, basePositiony+yincrement),
						Vector2(basePositionx+(2*xincrement), basePositiony+yincrement),
						Vector2(basePositionx+(3*xincrement), basePositiony+yincrement)]
	var count = 0
	for x in inventory:
		var instance = x.instantiate()
		add_child(instance)
		instances.append(instance)
		instance.position = inventoryVectors[count]
		count = count + 1

static func AddFurniture(furnishing):
	furnishings.append(furnishing)
	Turns.IncrementAction()

static func RemoveFurniture(furnishing):
	furnishings.pop_at(furnishings.find(furnishing))
	
func _ready() -> void:
	DirContents(path)
	inv = PopulateInventory()
	InstantiateItems(inv)
