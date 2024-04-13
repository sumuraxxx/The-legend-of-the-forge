extends BossRef

@export var max_bullets = 2

var count_bullets = 0

var spawn_points = []

@onready var bullet_scene = preload("res://Scenees/bullet_golem.tscn")

func _ready() -> void:
	for child in $SpawnPoints.get_children():
		spawn_points.append(child)


func classic_attack() -> void:
	if count_bullets < max_bullets:
		var id = randi_range(0, len(spawn_points) - 1)
		var bullet = bullet_scene.instantiate()
		bullet.global_position = spawn_points[id].global_position
		print(id)
		get_parent().add_child(bullet)
		count_bullets += 1
		
		
func _on_timer_timeout() -> void:
	classic_attack()
