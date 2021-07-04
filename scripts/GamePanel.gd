extends Control

var x
var z

func _ready():
	print(GameData.mainData.score)
	$Score/Count.text = str(GameData.mainData.score)
	$Health/Count.text =  str(GameData.mainData.health)
	$Petrol/Count.text = str(GameData.mainData.petrol)
	$FinLabel.visible = false
	x = 0
	z = 0
	pass

func _process(delta):
	#change_parameters()
	#if (!GameData.mainData.infiniteMod):
	#	check_final()
	pass

func check_final():
	if (GameData.mainData.score >= 1200):
		GameData.mainData.health = 100;
		GameData.mainData.petrol = 100;
		$FinLabel.visible = true
		$FinLabel.text = tr("SCORE_FIN")
		pass
	if (GameData.mainData.health <= 0):
		$FinLabel.visible = true
		$FinLabel.text = tr("HEALTH_FIN")
		get_tree().paused = true
		pass
	if (GameData.mainData.petrol <= 0):
		$FinLabel.visible = true
		$FinLabel.text = tr("PETROL_FIN")
		get_tree().paused = true
		pass
	pass

func change_parameters():
	if (!GameData.mainData.infiniteMod):
		if (Input.is_action_pressed("forward_move") || Input.is_action_pressed("back_move") || Input.is_action_pressed("left_move") || Input.is_action_pressed("right_move")):
			GameData.mainData.petrol -= 0.01
		else:
			GameData.mainData.health -= 0.01
		$Health/Count.text =  str(round(GameData.mainData.health))
		$Petrol/Count.text = str(round(GameData.mainData.petrol))
		$Petrol/Count.text = str(round(GameData.mainData.petrol))
	
	GameData.mainData.score += sqrt((GameData.mainData.xPos - x)*(GameData.mainData.xPos - x)+(GameData.mainData.yPos - z)*(GameData.mainData.yPos - z))
	x = GameData.mainData.xPos
	z = GameData.mainData.yPos
	
	$Score/Count.text = str(round(GameData.mainData.score))
	
	pass
