extends Area2D
class_name Door

var scene: PackedScene

func _ready() -> void:
	scene_init()
	connect("body_entered", _on_body_entered)


func scene_init() -> void:
	pass
	
	
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().change_scene_to_packed(scene)
