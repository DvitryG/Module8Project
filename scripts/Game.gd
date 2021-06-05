extends Node


func _ready():
	
	settings()
	
	pass

func settings():
	if (Settings.blur):
		$WorldEnvironment.get_environment().dof_blur_far_enabled = true
	else:
		$WorldEnvironment.get_environment().dof_blur_far_enabled = false
	pass

func gen_world():
	
	pass
