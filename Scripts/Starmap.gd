extends Node3D

##Galaxy Map Spawner
# Parent, and kind of wrapper for the galaxy object
# e.g. UI saving/loading goes through this
const GALAXY = preload("res://galaxy.tscn")

@onready var editor_canvas_layer = $CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func clear_existing_galaxies():
	for child_node in get_children():
		if child_node is Galaxy:
			remove_child(child_node)
			child_node.queue_free()
	
func create_new_galaxy(seed, numberOfSystems, galaxyRadius, galaxyThickness):

	var galaxyInstance = GALAXY.instantiate()
	galaxyInstance.seed = seed
	galaxyInstance.numberOfSystems = numberOfSystems
	galaxyInstance.galaxyRadius = galaxyRadius
	galaxyInstance.galaxyThickness = galaxyThickness
	galaxyInstance.procedurally_generate_systems_map()
	self.add_child(galaxyInstance)
	
	print("created galaxy: \n" + "\nseed: " + str(seed) + "\nSystems: "+ str(numberOfSystems) + "\nRadius: " + str(galaxyRadius) + "\nThickness: " + str(galaxyThickness))
	
func load_galaxy_from_file(filePath):
	var galaxyInstance = GALAXY.instantiate()
	galaxyInstance.load_and_generate_systems_from_file(filePath)
	self.add_child(galaxyInstance)
	
	print("created galaxy from file: " + filePath)
	
func save_galaxy_to_file(filePath):
	for child_node in get_children():
		if child_node is Galaxy:
			child_node.save_systems_to_file(filePath)
			return
	
	
	
func _on_create_new_galaxy_menu_create_new_map(seed, numberOfSystems, galaxyRadius, galaxyThickness):
	clear_existing_galaxies()
	create_new_galaxy(seed, numberOfSystems, galaxyRadius, galaxyThickness)
	editor_canvas_layer.show()

# this signal is sent when the LoadFromFileWindow is used to select a file to load
# this function uses it to create the galaxy from the file data
func _on_load_file_selected(path):
	clear_existing_galaxies()
	load_galaxy_from_file(path)
	editor_canvas_layer.show()

# when the save to file window is used to select a file to save to
# this function uses it to save the galaxy to file
func _on_save_to_file_window_file_selected(path):
	save_galaxy_to_file(path)
