extends Node

var all_dialogs = []

func _ready() -> void:
	for child in get_children():
		if child is DialogRefernce:
			all_dialogs.append(child)
			
