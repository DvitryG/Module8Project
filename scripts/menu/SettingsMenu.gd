extends Control


func _ready():
	$MainPanel/HeadPanel/BackButton.connect("pressed", self, "goBack")
	pass

func goBack():
	# пока только в главное меню
	get_tree().change_scene("res://scenes/menu/MainMenu.tscn") 
	pass
