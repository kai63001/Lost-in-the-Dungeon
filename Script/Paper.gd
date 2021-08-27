extends Area2D

onready var paper = $paper
onready var player = get_parent().get_parent().get_node("Player/Player")
var callDialog = [false]
export var text = "GOD"

func _ready():
	paper.use_parent_material = false

func _on_Paper_body_entered(body):
	if (body == player):
		if (!callDialog[0]):
			player.callDialog("what paper is that?",2)
			callDialog[0] = true
		player.showSpacebar()
		player.connect("accept",self,"_on_read_paper")
		
func _on_read_paper():
	print(text)
	player.hideSpacebar()
	paper.use_parent_material = true
	
	
func _on_Paper_body_exited(body):
	if (body == player):
		paper.use_parent_material = false
		player.disconnect("accept",self,"_on_read_paper")
		player.hideSpacebar()		
