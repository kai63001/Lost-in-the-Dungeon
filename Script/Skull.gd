extends Area2D

onready var player = get_parent().get_parent().get_node("Player/Player")
var run = false

func _on_Skull_body_entered(body):
	if(body == player && !run):
		print("body")
		player.callDialog("Is it real?",2)
		run = true
