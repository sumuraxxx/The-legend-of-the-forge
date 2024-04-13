extends Node2D

signal king_init

@export var player: CharacterBody2D
@export var king: PackedScene

func _ready() -> void:
	if !player.can_watch_start_dialog:
		var king = king.instantiate()
		king.global_position = $Door.global_position
		$CanvasLayer/StartDialog.responsible_for_the_beginning = king
		king.start_point = $Door.global_position
		king.end_point = $Marker2D.global_position
		king.start_dialog = $CanvasLayer/StartDialog
		add_child(king)
		emit_signal("king_init")
		player.force_change_watch_animation_state()
		
