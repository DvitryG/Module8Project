extends Control


func _ready():
	$MainPanel/HeadPanel/BackButton.connect("pressed", self, "back")
	$MainPanel/SettingsContainer/ResolutionOptions.connect("item_selected", self, "resolution")
	$MainPanel/SettingsContainer/FullscreenCheck.connect("toggled", self, "fullscreen")
	$MainPanel/SettingsContainer/MaVPanel/MaVSlider.connect("value_changed", self, "setMasterVolume")
	$MainPanel/SettingsContainer/MuVPanel/MuVSlider.connect("value_changed", self, "setMusicVolume")
	$MainPanel/SettingsContainer/EVPanel/EVSlider.connect("value_changed", self, "setEffectsVolume")
	
	addResolutionItems()
	if (Settings.fullscreen):
		$MainPanel/SettingsContainer/FullscreenCheck.pressed = true
	
	pass

func back():
	# пока только в главное меню
	get_tree().change_scene("res://scenes/menu/MainMenu.tscn") 
	pass

func addResolutionItems():
	$MainPanel/SettingsContainer/ResolutionOptions.add_item("1920 x 1080", 0)
	$MainPanel/SettingsContainer/ResolutionOptions.add_item("1600 x 900", 1)
	$MainPanel/SettingsContainer/ResolutionOptions.add_item("1366 x 768", 2)
	$MainPanel/SettingsContainer/ResolutionOptions.add_item("1280 x 1024", 3)
	$MainPanel/SettingsContainer/ResolutionOptions.add_item("1024 x 768", 4)
	$MainPanel/SettingsContainer/ResolutionOptions.add_item("800 x 600", 5)
	
	match Vector2(Settings.resWidth, Settings.resHeight):
		Vector2(1920,1080):
			$MainPanel/SettingsContainer/ResolutionOptions.select(0)
		Vector2(1600,900):
			$MainPanel/SettingsContainer/ResolutionOptions.select(1)
		Vector2(1366,768):
			$MainPanel/SettingsContainer/ResolutionOptions.select(2)
		Vector2(1280,1024):
			$MainPanel/SettingsContainer/ResolutionOptions.select(3)
		Vector2(1024,768):
			$MainPanel/SettingsContainer/ResolutionOptions.select(4)
		Vector2(800,600):
			$MainPanel/SettingsContainer/ResolutionOptions.select(5)
	
	pass

func resolution(item):
	
	match item:
		0:
			Settings.resWidth = 1920
			Settings.resHeight = 1080
		1:
			Settings.resWidth = 1600
			Settings.resHeight = 900
		2:
			Settings.resWidth = 1366
			Settings.resHeight = 768
		3:
			Settings.resWidth = 1280
			Settings.resHeight = 1024
		4:
			Settings.resWidth = 1024
			Settings.resHeight = 768
		5:
			Settings.resWidth = 800
			Settings.resHeight = 600
	Settings.resolution()
	Settings.save_game()
	
	pass

func fullscreen(pressed):
	if (pressed == true):
		Settings.fullscreen = true
	elif (pressed == false):
		Settings.fullscreen = false
	Settings.resolution()
	Settings.save_game()
	
	pass

func setMasterVolume(value):
	if (value == 0):
		Settings.masterMute = true
	else:
		Settings.masterMute = false
		Settings.masterVolume = value
	Settings.set_music_volume()
	Settings.save_game()
	pass

func setMusicVolume(value):
	if (value == 0):
		Settings.musicMute = true
	else:
		Settings.masterMute = false
		Settings.musicVolume = value
	Settings.set_music_volume()
	Settings.save_game()
	pass

func setEffectsVolume(value):
	if (value == 0):
		Settings.effectsMute = true
	else:
		Settings.masterMute = false
		Settings.effectsVolume = value * 20
	#
	Settings.save_game()
	pass

func set_mute_music():
	#if (Settings.masterVolume == 0 or Settings.musicVolume == 0):
	#	if ()
	pass
