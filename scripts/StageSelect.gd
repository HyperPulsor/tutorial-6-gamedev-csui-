extends LinkButton

func _on_StageSelect_pressed():
	get_tree().change_scene(str("res://scenes/StageSelect.tscn"))
