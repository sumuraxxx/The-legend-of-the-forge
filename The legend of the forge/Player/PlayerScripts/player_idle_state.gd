extends State

func update(delta: float) -> void:
	if(Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down")):
		emit_signal("state_transition", self, "PlayerWalkState")
