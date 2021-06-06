extends Control


func _ready():
	$MainPanel/HeadPanel/BackButton.connect("pressed", self, "back")
	$MainPanel/SettingsContainer/ResolutionOptions.connect("item_selected", self, "resolution")
	$MainPanel/SettingsContainer/FullscreenCheck.connect("toggled", self, "fullscreen")
	$MainPanel/SettingsContainer/MaVPanel/MaVSlider.connect("value_changed", self, "set_master_volume")
	$MainPanel/SettingsContainer/MuVPanel/MuVSlider.connect("value_changed", self, "set_music_volume")
	$MainPanel/SettingsContainer/EVPanel/EVSlider.connect("value_changed", self, "set_effects_volume")
	$MainPanel/SettingsContainer/TPanel/TranslationOptions.connect("item_selected", self, "set_language")
	$MainPanel/SettingsContainer/BlurCheck.connect("toggled", self, "blur")
	
	
	add_lang_items()
	add_resolution_items()
	if (Settings.fullscreen):
		$MainPanel/SettingsContainer/FullscreenCheck.pressed = true
	
	if (Settings.blur):
		$MainPanel/SettingsContainer/BlurCheck.pressed = true
	
	$MainPanel/SettingsContainer/MaVPanel/MaVSlider.value = Settings.masterVolume
	$MainPanel/SettingsContainer/MuVPanel/MuVSlider.value = Settings.musicVolume
	$MainPanel/SettingsContainer/EVPanel/EVSlider.value = Settings.effectsVolume
	
	pass

func back():
	self.visible = false
	pass

func add_lang_items():
	$MainPanel/SettingsContainer/TPanel/TranslationOptions.add_item("English", 0)
	$MainPanel/SettingsContainer/TPanel/TranslationOptions.add_item("Русский", 1)
	
	match Settings.lang:
		"en":
			$MainPanel/SettingsContainer/TPanel/TranslationOptions.select(0)
		"ru":
			$MainPanel/SettingsContainer/TPanel/TranslationOptions.select(1)
	pass

func add_resolution_items():
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

func set_language(item):
	match item:
		0:
			Settings.lang = "en"
		1:
			Settings.lang = "ru"
	Settings.set_language()
	Settings.save_game()
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

func blur(pressed):
	if (pressed == true):
		Settings.blur = true
	elif (pressed == false):
		Settings.blur = false
	Settings.save_game()
	pass

func set_master_volume(value):
	if (value == 0):
		Settings.masterMute = true
		Settings.set_mute_music()
		Settings.set_mute_effects()
	else:
		Settings.masterVolume = value
		if (Settings.masterMute == true):
			Settings.masterMute = false
			Settings.set_mute_music()
			Settings.set_mute_effects()
	
	Settings.set_music_volume()
	Settings.save_game()
	pass

func set_music_volume(value):
	if (value == 0):
		Settings.musicMute = true
		Settings.set_mute_music()
	else:
		Settings.musicVolume = value
		if (Settings.musicMute == true):
			Settings.musicMute = false
			Settings.set_mute_music()
	
	Settings.set_music_volume()
	Settings.save_game()
	pass

func set_effects_volume(value):
	if (value == 0):
		Settings.effectsMute = true
	else:
		Settings.masterMute = false
		Settings.effectsVolume = value * 20
	
	Settings.set_mute_effects()
	Settings.save_game()
	pass
