extends Area2D

export (String) var sceneName = "Level 1"

func _on_Area_Trigger_body_entered(body):
	var current_scene = get_tree().get_current_scene().get_name()
	if body.get_name() == "Player":
		if current_scene == sceneName:
			global.lives -=1
		if (global.lives == 0):
			get_tree().change_scene(str("res://scenes/Game Over.tscn"))
		else:
			get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
