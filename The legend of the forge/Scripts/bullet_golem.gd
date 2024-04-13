extends Bullet

func init_target() -> void:
	target = $"../Player"

func change_rotation() -> void:
	if target:
		$Sprite2D.rotation = (target.global_position - global_position).angle()
		$CollisionShape2D.rotation = (target.global_position - global_position).angle()
