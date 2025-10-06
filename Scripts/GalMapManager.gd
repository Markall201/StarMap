extends Control
@onready var system_label = %"System Label"
@onready var system_stars = %"System Stars"
@onready var system_planets = %"System Planets"
@onready var system_coordsX = %"System CoordsX"
@onready var system_coordsY = %"System CoordsY"
@onready var system_coordsZ = %"System CoordsZ"
@onready var system_seed = %"System Seed"
@onready var system_faction = %"System Faction"


# Called when the node enters the scene tree for the first time.
func _ready():
	setLabelsEmpty()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# method to clear the UI text
func setLabelsEmpty():
	system_label.text = ""
	system_stars.text = ""
	system_planets.text = ""
	system_coordsX.text = ""
	system_coordsY.text = ""
	system_coordsZ.text = ""
	system_seed.text = ""
	system_faction.text = ""
	return

# method to set label data
func setLabels(systemName, numberOfPlanets, numberOfStars, location, seed, faction):
	system_label.text = systemName
	system_stars.text = str(numberOfStars)
	system_planets.text = str(numberOfPlanets)
	system_coordsX.text = str(location.x)
	system_coordsY.text = str(location.y)
	system_coordsZ.text = str(location.z)
	system_seed.text = str(seed)
	system_faction.text = faction
	return

# custom signal "highlight" emitted by SystemPlaceholder
func _on_system_placeholder_highlight(systemName, numberOfPlanets, numberOfStars, location, seed, faction):
	# pass details to UI
	setLabels(systemName, numberOfPlanets, numberOfStars, location, seed, faction)
