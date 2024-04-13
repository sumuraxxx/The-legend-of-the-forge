extends CharacterBody2D
class_name Bullet

const SPEED = 50

var target: CharacterBody2D

@onready var timer = $Timer
@onready var nav_agent = $NavigationAgent2D

func change_rotation() -> void:
	pass
	

func init_target() -> void:
	pass

func _ready() -> void:
	init_target()
	make_path()
	if timer:
		timer.connect("timeout", timer_finish)
		

func movement() -> void:
	var direction = to_local(nav_agent.get_next_path_position()).normalized()	
	velocity = direction * SPEED
	
	
func make_path() -> void:
	if target:
		nav_agent.target_position = target.global_position
	

func _physics_process(delta: float) -> void:
	change_rotation()
	movement()
	move_and_slide()
	
			
func timer_finish() -> void:
	make_path()		
