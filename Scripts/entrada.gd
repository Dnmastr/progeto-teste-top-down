extends Area2D

@export var proxarea = ""

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		Trasiçãodetela.change_scene_with_fade(proxarea)
