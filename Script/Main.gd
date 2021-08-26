extends Node2D

onready var player = $YSort/Player

func _ready():
	#DIALOG
	player.callDialog("Where the fuck!!",2)
	yield($YSort/Player/dialog,"hide")
	player.callDialog("what happened to me",2)
	
