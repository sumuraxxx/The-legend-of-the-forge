extends State

var player: Player
var data = preload("res://Player/PlayerData.tres")
var speed = data.speed

func enter() -> void:
	player = get_parent().get_parent()
	

func update(delta: float) -> void:
	var direction = Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down")
	if direction == Vector2.ZERO:
		emit_signal("state_transition", self, "PlayerIdleState")
	player.velocity = direction * speed
	player.move_and_slide()

