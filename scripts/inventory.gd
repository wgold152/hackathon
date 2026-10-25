extends Node

class_name Inventory

var furnishings = []
var inventory = []
var furnitureStore = []

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

func PopulateInventory():
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

func AddFurniture(furnishing):
	furnishings.append(furnishing)
	Turns.action + 1

func PaintRoom(section, paint):
	Turns.action + 1

func RemoveFurniture(furnishing):
	furnishings.pop_at(furnishings.find(furnishing))
