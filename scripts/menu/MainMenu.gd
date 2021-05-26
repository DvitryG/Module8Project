extends Control


func _ready():
	$MainPanel/OptionButtons/StartButton.connect("pressed", self, "start_game")
	$MainPanel/OptionButtons/SetingsButton.connect("pressed", self, "open_settings")
	$MainPanel/OptionButtons/ExitButton.connect("pressed", self, "exit_game")
	pass

func start_game():
	pass

func open_settings():
	get_tree().change_scene("res://scenes/menu/SettingsMenu.tscn")
	pass

func exit_game():
	get_tree().quit()
	pass
