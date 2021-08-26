extends Camera2D

onready var player = get_parent().get_node("Player")

func _physics_process(delta):
	position = player.position
