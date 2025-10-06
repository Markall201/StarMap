extends Control

# the Create New Galaxy Menu is a sibling node in main scene, under Menu UI
@onready var create_new_galaxy_menu = $"../Create New Galaxy Menu"
@onready var load_from_file_window = $"../LoadFromFileWindow"
# go to main game scene
func _on_new_map_pressed():
	create_new_galaxy_menu.show()
	create_new_galaxy_menu.set_process_input(true)
	self.hide()
	self.set_process_input(false)

func _on_load_map_pressed():
	load_from_file_window.current_dir = "res://SystemsData"
	load_from_file_window.show()


func _on_options_pressed():
	pass # Replace with function body.


# quits the game
func _on_quit_pressed():
	get_tree().quit()
