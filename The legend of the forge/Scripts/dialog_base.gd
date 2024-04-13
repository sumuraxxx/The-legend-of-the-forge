extends Control
class_name DialogBase

signal dialog_finish

@export var responsible_for_the_beginning: Node
@export var text: Label
@export var speakers: Label

var can_play = false

@onready var dialogs_data = $DialogsData

func say_line(speaker: String, line: String) -> void:
	text.text = ""
	speakers.text = speaker
	for i in line:
		text.text += i
		await get_tree().create_timer(0.1).timeout
 

func says_lines() -> void:
	var replicas = dialogs_data.all_dialogs
	for i in replicas:
		await say_line(i.speaker, i.replica)
		await get_tree().create_timer(0.3).timeout
		
	visible = false	
	can_play = false
	dialog_finish.emit()
		
		
func _ready() -> void:	
	visible = false	
	$"../..".connect("king_init", king_init)
	
	
func king_init() -> void:
	responsible_for_the_beginning.connect("can_start_dialog", start_dialog)
	
		
func start_dialog() -> void:
	visible = true
	can_play = true
	call_deferred("says_lines")	
