extends Node

func saveGame(path: String) -> void:
	var saveFile = FileAccess.open(path, FileAccess.WRITE)
	# game will save based on the game state Global Group
	var saveNodes = get_tree().get_nodes_in_group("gameState")
	for node in saveNodes:
		if node.scene_file_path.is_empty():
			continue
		
		if !node.has_method("save"):
			continue
		
		var nodeData = node.call("save")
		var jsonString = JSON.stringify(nodeData)
		
		saveFile.store_line(jsonString)

func getSave(path: String) -> void:
	if  not FileAccess.file_exists(path):
		print("Error: JSON path " + path + " is not in a valid path")
		pass
	
	# set game state to what we saved it to
	pass
