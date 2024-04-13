extends CharacterBody2D

signal can_start_dialog

const SPEED = 100

@export var start_dialog: Control

@export var start_point: Vector2 = global_position
@export var end_point: Vector2

var can_send_signal = true
var can_king_live = false

func _ready() -> void:
	start_dialog.connect("dialog_finish", _processing_end_of_dialog)


func _physics_process(delta: float) -> void:
	movement()


func movement() -> void:
	if position.distance_to(end_point) > 1:
		var direction = to_local(end_point).normalized()
		velocity = direction * SPEED
		move_and_slide()
		print(direction)
	elif can_send_signal:
		emit_signal("can_start_dialog")	
		can_send_signal = false
	elif can_king_live:
		queue_free()	
		

func _processing_end_of_dialog() -> void:
	var temp = start_point
	start_point = end_point
	end_point = temp
	can_king_live = true	
