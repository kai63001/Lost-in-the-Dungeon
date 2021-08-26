extends Node2D

onready var player = $Player/Player

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	player.callDialog("Where the fuck!!",2)
	yield($Player/Player/dialog,"hide")
	player.callDialog("what happened to me",2)
	
