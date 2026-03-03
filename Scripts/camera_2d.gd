extends Camera2D

@export var tilemap_layer: TileMapLayer

func _ready():
	if tilemap_layer == null:
		push_error("TileMapLayer não atribuída!")
		return
	
	var rect = tilemap_layer.get_used_rect()
	var tile_size = tilemap_layer.tile_set.tile_size
	
	limit_left = rect.position.x * tile_size.x
	limit_top = rect.position.y * tile_size.y
	limit_right = rect.end.x * tile_size.x
	limit_bottom = rect.end.y * tile_size.y
