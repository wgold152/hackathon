extends Node

class_name Inventory

static var furnishings = []
static var inventory = []
static var furnitureStore = []

var path = 'res://scenes/furniture/'

func dir_contents(path):
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

static func PopulateInventory():
	var temp
	var i = 0
	
	#reset inventory
	inventory.clear()
	inventory.resize(8)
	
	while i < 8:
		temp = furnitureStore.pick_random()
		
		#prevents duplicate furniture
		if not inventory.has(temp):
			inventory[i] = temp
			i + 1

static func AddFurniture(furnishing):
	furnishings.append(furnishing)
	Turns.IncrementTurn()

static func PaintRoom(section, paint):
	Turns.IncrementTurn()

static func RemoveFurniture(furnishing):
	furnishings.pop_at(furnishings.find(furnishing))
