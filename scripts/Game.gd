extends Node

var pause = false;

func _ready():
	$Pause.visible = pause
	$Pause/Panel/VBoxContainer/ContinueButton.connect("pressed", self, "continue_game")
	$Pause/Panel/VBoxContainer/SettingsButton.connect("pressed", self, "open_settings")
	$Pause/Panel/VBoxContainer/ExitButton.connect("pressed", self, "exit_game")
	settings()
	
	pass

func _process(delta):
	if (Input.is_action_just_pressed("ui_cancel")):
		continue_game()
	pass


func settings():
	if (Settings.blur):
		$WorldEnvironment.get_environment().dof_blur_far_enabled = true
	else:
		$WorldEnvironment.get_environment().dof_blur_far_enabled = false
	pass

func gen_world():
	
	pass

func continue_game():
	if (pause == true):
		pause = false
	else:
		pause = true
	$Pause.visible = pause
	settings()
	pass

func open_settings():
	$SettingsMenu.visible = true
	pass

func exit_game():
	get_tree().change_scene("res://scenes/menu/MainMenu.tscn")
	pass
