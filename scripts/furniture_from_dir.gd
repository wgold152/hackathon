extends Node

class_name FurnitureStore

static var furnitureArr = []
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
				furnitureArr.append(load(path + file_name))
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		
func _ready() -> void:
	dir_contents(path)
	print(furnitureArr)
