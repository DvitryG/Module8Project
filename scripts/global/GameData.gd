extends Control

const MAIN_SAVE_PATH = "res://save/game/mainData.json"
const CITIZENS_SAVE_PATH = "res://save/game/citizensData.json"
const BUILDINGS_SAVE_PATH = "res://save/game/buildingsData.json"

var mainData = {
	gameCreated = false,
	xPos = 0,
	yPos = 0,
	angle = 0,
	worldSeed = 0,
	score = 0,
	health = 100,
	petrol = 100,
	infiniteMod = false
}

#var citizensData = {}

#var buildingsData = {}
 

func _ready():
	mainData = load_game(mainData, MAIN_SAVE_PATH)
#	citizensData = load_game(citizensData, CITIZENS_SAVE_PATH)
#	buildingsData = load_game(buildingsData, BUILDINGS_SAVE_PATH)
	pass 

func get_seed():
	var time = OS.get_time()
	var worldSeed = int(time.hour + time.minute + time.second)
	return worldSeed

func save_game(data, SAVE_PATH):
	var saveFile = File.new()
	saveFile.open(SAVE_PATH, File.WRITE)
	saveFile.store_line(to_json(data))
	saveFile.close()
	pass

func load_game(data, SAVE_PATH):
	var saveFile = File.new()
	if (not saveFile.file_exists(SAVE_PATH)):
		save_game(data, SAVE_PATH)
	
	saveFile.open(SAVE_PATH, File.READ)
	
	data = parse_json(saveFile.get_as_text())
	
	saveFile.close()
	return data
