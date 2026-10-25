extends Node

class_name Inventory

var furnishings = []
var inventory = [0, 1, 2, 3, 4, 5, 6, 7]
var furnitureStore = []

func StockStore(stock):
	furnitureStore.assign(stock)

func PopulateInventory():
	var temp
	var i = 0
	
	while i < 8:
		temp = furnitureStore.pick_random()
		
		#prevents duplicate furniture
		if not inventory.has(temp):
			inventory[i] = temp
			i + 1

func PlaceFurniture(furnishing):
	furnishings.append(furnishing)

func RemoveFurniture(furnishing):
	furnishings.pop_at(furnishings.find(furnishing))
