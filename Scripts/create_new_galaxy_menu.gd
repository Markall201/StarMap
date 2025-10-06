extends Control

@export var seed: int;
@export var numberOfSystems: int;
@export var galaxyRadius: int;
@export var galaxyThickness: int;

@onready var main_menu = $"../Main Menu"
@onready var btn_save_to_file = $"../Save to File"


signal createNewMap(seed, numberOfSystems, galaxyRadius, galaxyThickness)

func validateInput():
	if (seed != null and numberOfSystems != null and galaxyRadius != null and galaxyThickness != null):
		return true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	

# go back to main menu branch and hide current branch
func _on_back_pressed():
	main_menu.show()
	main_menu.set_process_input(true)
	self.hide()
	self.set_process_input(false)

# validate input and trigger new map branch!
func _on_new_map_pressed():
	#get_tree().change_scene_to_file("res://main.tscn")
	if(validateInput()):
		createNewMap.emit(seed, numberOfSystems, galaxyRadius, galaxyThickness)
		self.hide()
		self.set_process_input(false)
		btn_save_to_file.show()
		main_menu.show()
		main_menu.set_process_input(true)

# receiving custom signals:

func _on_fieldctl_number_of_systems_value_change(label, fieldValue):
	numberOfSystems = int(fieldValue);
	print("new value: " + str(numberOfSystems))


func _on_fieldctl_seed_value_change(label, fieldValue):
	seed = int(fieldValue);
	print("new value: " + str(seed))

func _on_fieldctl_galaxy_thickness_value_change(label, fieldValue):
	galaxyThickness = int(fieldValue);
	print("new value: " + str(galaxyThickness))

func _on_fieldctl_galaxy_radius_value_change(label, fieldValue):
	galaxyRadius = int(fieldValue)
	print("new value: " + str(galaxyRadius))
