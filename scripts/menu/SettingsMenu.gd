extends Control


func _ready():
	$MainPanel/HeadPanel/BackButton.connect("pressed", self, "back")
	pass

func back():
	# пока только в главное меню
	get_tree().change_scene("res://scenes/menu/MainMenu.tscn") 
	pass
