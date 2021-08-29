extends Area2D

var run = false
export var howManyTrap = 1
var colition
onready var trap = $TrapAnimation
onready var boxColition = $CollisionShape2D


func _ready():
	pass # Replace with function body.


func _on_Trap_body_entered(body):
	if(body.is_in_group("player") && run == false):
		$TrapAnimation.play("trap")
		print("1")
		run = true


func _on_Trap_body_exited(body):
	if(body.is_in_group("player")):
		$TrapAnimation.stop()
