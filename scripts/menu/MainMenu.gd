extends Control


func _ready():
	$PanelContainer/OptionButtons/StartButton.connect("pressed", self, "startGame")
	$PanelContainer/OptionButtons/SetingsButton.connect("pressed", self, "openSettings")
	$PanelContainer/OptionButtons/ExitButton.connect("pressed", self, "exitGame")
	pass

func startGame():
	pass

func openSettings():
	pass

func exitGame():
	get_tree().quit()
	pass
