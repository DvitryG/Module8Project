extends Control

# Temporary

const SAVE_PATH = "res://save.json"
var settings = {}
var playMusic = 1
var playEffects = 1
var newChoice = 1
var song
var menu = true

# Saved

var masterVolume = 2000
var musicVolume = 2000
var effectsVolume = 2000

var masterMute = false
var musicMute = false
var effectsMute = false

var resWidth = 1920 # ProjectSettings.get_setting("display/window/size/width")
var resHeight = 1080 # ProjectSettings.get_setting("display/window/size/height")
var fullscreen = false

var keyTimePause = 32
var keyGamePause = 16777217

func _ready():
	load_game()
	choose_music()
	resolution()
	pass 

func _process(delta):
	
	pass

func _input(event):
	pass

func choose_music():
	pass

func menu_music():
	pass

func game_music():
	pass

func resolution():
	pass

func save_game():
	pass

func load_game():
	pass


