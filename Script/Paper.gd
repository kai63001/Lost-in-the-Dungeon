extends Area2D

onready var paper = $paper
onready var player = get_parent().get_parent().get_node("Player/Player")
export (PackedScene) var Paper
var callDialog = [false]
export(String, MULTILINE) var text = "GOD"
var openPaper = false

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
	if(openPaper) :
		player.disconnect("accept",self,"_on_read_paper")
		openPaper = false
		get_tree().call_group("paper", "queue_free")
	else:
		player.hideSpacebar()
		paper.use_parent_material = true
		var readIt = Paper.instance()
		add_child(readIt)
		openPaper = true
		readIt.text(text)
	
	
func _on_Paper_body_exited(body):
	if (body == player):
		openPaper = false		
		player.disconnect("accept",self,"_on_read_paper")
		player.hideSpacebar()
		get_tree().call_group("paper", "queue_free")

