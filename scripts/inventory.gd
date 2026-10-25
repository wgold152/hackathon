extends Node

class_name Inventory

var furnishings = []
var inventory = []
var furnitureStore = []

func StockStore(stock):
	furnitureStore.assign(stock)

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
