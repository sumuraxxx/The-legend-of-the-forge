extends CharacterBody2D
class_name Player

var data = preload("res://Player/PlayerData.tres")
var can_watch_start_dialog = data.was_there_starting_animation

@export var start_dialoge: Control

func _ready() -> void:
	if start_dialoge:
		start_dialoge.connect("dialoge_finish", _processing_end_of_start_dialog)
	

func force_change_watch_animation_state() -> void:
	data.was_there_starting_animation = true
	
	
func _processing_end_of_start_dialog() -> void:
	data.was_there_starting_animation = true
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Bullet:
		body.queue_free()
