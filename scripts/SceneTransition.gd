extends CanvasLayer

func change_scene(target: String, type: String = "dissolve") -> void:
	$Sprite.visible = true
	if type == "dissolve" or type == "fadeout":
		$AnimationPlayer.play(type)
		yield($AnimationPlayer, "animation_finished")
		get_tree().change_scene(target)
		$AnimationPlayer.play_backwards(type)
		yield($AnimationPlayer, "animation_finished")
		$Sprite.visible = false
	else:
		$AnimationPlayer.play(type)
		get_tree().change_scene(target)
		yield($AnimationPlayer, "animation_finished")
		$Sprite.visible = false
