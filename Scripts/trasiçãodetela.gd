extends CanvasLayer

@onready var anim = $AnimationPlayer

func change_scene_with_fade(scene_path: String) -> void:
	anim.play("FadeOut")
	await anim.animation_finished
	
	get_tree().change_scene_to_file(scene_path)
	
	await get_tree().process_frame
	
	anim.play("FadeIn")
