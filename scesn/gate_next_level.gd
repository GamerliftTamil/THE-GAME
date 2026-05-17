extends Area2D

const FILE_BEGIN = "res://scesn/Levels/level_"

func _on_body_entered(body):
	
	if body.is_in_group("player"):
		
		$AnimatedSprite2D.play("opening")
		var current_scene = get_tree().current_scene.scene_file_path

		# Gets "1" from "level_1.tscn"
		var current_level = current_scene.get_file().get_basename().trim_prefix("level_").to_int()

		var next_level_num = current_level + 1

		var next_level_path = FILE_BEGIN + str(next_level_num) + ".tscn"

		get_tree().call_deferred("change_scene_to_file", next_level_path)
