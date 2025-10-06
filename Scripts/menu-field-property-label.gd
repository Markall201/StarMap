extends Control

@onready var labelctl = $VBoxContainer/Label 
@export var fieldValue: String
@export var label: String:
	set(val):
		label = val
		if (labelctl):
			labelctl.text = label
		
# custom signal to emit when the field's changed
signal valueChange(label:String, fieldValue:String)

func _on_line_edit_text_submitted(new_text):
	fieldValue = new_text
	valueChange.emit(label, fieldValue)

func _ready():
	if (labelctl):
			labelctl.text = label
