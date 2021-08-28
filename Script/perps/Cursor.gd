extends Node2D

var tile_size = 16
			
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _physics_process(delta):
	print(get_viewport_rect())
	position = Vector2(int((get_global_mouse_position().x/tile_size)) * tile_size + 8,int((get_global_mouse_position().y/tile_size)) * tile_size + 8)
