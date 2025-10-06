extends FileDialog


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# when the save to file button is pressed, show this window
func _on_save_to_file_pressed():
	self.current_dir = "res://SystemsData"
	self.show()
