extends Control


func _ready():
	$MainPanel/OptionButtons/StartButton.connect("pressed", self, "start_new_game")
	$MainPanel/OptionButtons/SetingsButton.connect("pressed", self, "open_settings")
	$MainPanel/OptionButtons/ExitButton.connect("pressed", self, "exit_game")
	
	if (GameData.mainData.gameCreated == true):
		$MainPanel/OptionButtons/ContinueButton.visible = true
	else: 
		$MainPanel/OptionButtons/ContinueButton.visible = false
	
	pass

func start_new_game():
	# Сброс и генерация файлов сохранения
	GameData.mainData.worldSeed = 2
	get_tree().change_scene("res://scenes/Game.tscn")
	pass

func continue_game():
	get_tree().change_scene("res://scenes/Game.tscn")
	pass

func open_settings():
	$SettingsMenu.visible = true
	pass

func exit_game():
	get_tree().quit()
	pass
