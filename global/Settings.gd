extends Control

# Temporary

const SAVE_PATH = "res://settings.json"
var settings = {}
#var playMusic = 1
#var playEffects = 1
# var newChoice = 1
var song = load("res://assets/music/Dwarf_fortress.mp3")
# var menu = true

# Saved

var lang = "en"

var masterVolume = 100
var musicVolume = 100
var effectsVolume = 100

var masterMute = false
var musicMute = false
var effectsMute = false

var resWidth = 1920
var resHeight = 1080
var fullscreen = false

var keyTimePause = 32
var keyGamePause = 16777217

func _ready():
	load_game()
	set_language()
	set_mute_music()
	set_music_volume()
	resolution()
	pass 

func set_language():
	TranslationServer.set_locale(lang)
	pass

func set_mute_music():
	if (masterMute == false and musicMute == false):
		$Music.play()
	else:
		$Music.stop()
	pass

func set_mute_effects():
	pass

func set_music_volume():
	$Music.volume_db = (masterVolume * musicVolume) / 200 - 50
	pass

func resolution():
	ProjectSettings.set_setting("display/window/size/width", resWidth)
	ProjectSettings.set_setting("display/window/size/height", resHeight)
	OS.set_window_size(Vector2(resWidth, resHeight))
	
	if (fullscreen == true):
		OS.set_window_fullscreen(false)
		OS.set_window_fullscreen(true)
	elif (fullscreen == false):
		OS.set_window_fullscreen(true)
		OS.set_window_fullscreen(false)
		OS.set_window_position(Vector2(0,0))
	
	pass

func save_game():
	var settings = {
		language = lang,
		
		resolution = {
			width = resWidth,
			height = resHeight
		},
		
		fullscreen = fullscreen,
		
		volumeLevel = {
			masterVolume = masterVolume,
			masterMute = masterMute,
			musicVolume = musicVolume,
			musicMute = musicMute,
			effectsVolume = effectsVolume,
			effectsMute = effectsMute
		},
		
		keys = {
			keyTimePause = keyTimePause,
			keyGamePause = keyGamePause
		}
	}
	
	var saveFile = File.new()
	saveFile.open(SAVE_PATH, File.WRITE)
	saveFile.store_line(to_json(settings))
	saveFile.close()
	
	pass

func load_game():
	var saveFile = File.new()
	if (not saveFile.file_exists(SAVE_PATH)):
		return;
	
	saveFile.open(SAVE_PATH, File.READ)
	
	var data = {}
	data = parse_json(saveFile.get_as_text())
	
	saveFile.close()
	
	lang = data['language']
	
	masterVolume = data['volumeLevel']['masterVolume']
	musicVolume = data['volumeLevel']['musicVolume']
	effectsVolume = data['volumeLevel']['effectsVolume']
	
	masterMute = data['volumeLevel']['masterMute']
	musicMute = data['volumeLevel']['musicMute']
	effectsMute = data['volumeLevel']['effectsMute']
	
	resWidth = data['resolution']['width']
	resHeight = data['resolution']['height']
	fullscreen = data['fullscreen']
	
	keyTimePause = data['keys']['keyTimePause']
	keyGamePause = data['keys']['keyGamePause']
	
	pass


