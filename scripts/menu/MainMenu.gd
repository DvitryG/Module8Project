extends Control


func _ready():
	$MainPanel/OptionButtons/StartButton.connect("pressed", self, "startGame")
	$MainPanel/OptionButtons/SetingsButton.connect("pressed", self, "openSettings")
	$MainPanel/OptionButtons/ExitButton.connect("pressed", self, "exitGame")
	pass

func startGame():
	pass

func openSettings():
	get_tree().change_scene("res://scenes/menu/SettingsMenu.tscn")
	pass

func exitGame():
	get_tree().quit()
	pass
