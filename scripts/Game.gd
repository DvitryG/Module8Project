extends Node

var pause = false;
var x
var z

func _ready():
	$Pause.visible = pause
	$Pause/Panel/VBoxContainer/ContinueButton.connect("pressed", self, "continue_game")
	$Pause/Panel/VBoxContainer/SettingsButton.connect("pressed", self, "open_settings")
	$Pause/Panel/VBoxContainer/ExitButton.connect("pressed", self, "exit_game")
	settings()
	x = 0
	z = 0
	pass

func _process(delta):
	if (Input.is_action_just_pressed("ui_cancel")):
		continue_game()
	GameData.mainData.xPos = $M113.get_global_transform().origin.x
	GameData.mainData.yPos = $M113.get_global_transform().origin.z
	change_parameters()
	if (!GameData.mainData.infiniteMod):
		check_final()
	pass

func check_final():
	if (GameData.mainData.score >= 1200):
		GameData.mainData.health = 100;
		GameData.mainData.petrol = 100;
		$GamePanel/FinLabel.visible = true
		$GamePanel/FinLabel.text = tr("SCORE_FIN")
		pass
	if (GameData.mainData.health <= 0):
		$GamePanel/FinLabel.visible = true
		$GamePanel/FinLabel.text = tr("HEALTH_FIN")
		get_tree().paused = true
		pass
	if (GameData.mainData.petrol <= 0):
		$M113.enginePower = 0
		$GamePanel/FinLabel.visible = true
		$GamePanel/FinLabel.text = tr("PETROL_FIN")
		#get_tree().paused = true
		pass
	pass

func change_parameters():
	if (!GameData.mainData.infiniteMod):
		if (Input.is_action_pressed("forward_move") || Input.is_action_pressed("back_move") || Input.is_action_pressed("left_move") || Input.is_action_pressed("right_move")):
			GameData.mainData.petrol -= 0.01
		else:
			GameData.mainData.health -= 0.01
		$GamePanel/Health/Count.text =  str(round(GameData.mainData.health))
		$GamePanel/Petrol/Count.text = str(round(GameData.mainData.petrol))
		$GamePanel/Petrol/Count.text = str(round(GameData.mainData.petrol))
	
	GameData.mainData.score += sqrt((GameData.mainData.xPos - x)*(GameData.mainData.xPos - x)+(GameData.mainData.yPos - z)*(GameData.mainData.yPos - z))
	x = GameData.mainData.xPos
	z = GameData.mainData.yPos
	
	$GamePanel/Score/Count.text = str(round(GameData.mainData.score))
	
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
		if ($SettingsMenu.visible == true):
			$SettingsMenu.visible = false
		else:
			pause = false
	else:
		pause = true
	$Pause.visible = pause
	settings()
	get_tree().paused = pause
	pass

func open_settings():
	$SettingsMenu.visible = true
	pass

func exit_game():
	get_tree().change_scene("res://scenes/menu/MainMenu.tscn")
	get_tree().paused = false
	pass
