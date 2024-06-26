class_name FollowCamera
extends Camera2D

@export var tilemap: TileMap 

func _ready() -> void:
	var difference: int = 16
	setting_camera(difference)
	
	
func setting_camera(difference: int) -> void:
	var map_rect = tilemap.get_used_rect()
	var tile_size = tilemap.rendering_quadrant_size
	var world_size_in_pixels = map_rect.size * tile_size
	limit_right = world_size_in_pixels.x
	limit_bottom = world_size_in_pixels.y - difference
