extends KinematicBody2D

export var speed = 100

var velocity = Vector2.ZERO
onready var Dialog = $dialog
var inventoryOn = false

signal accept

func _physics_process(delta):
	_move(delta)
	_inventory();
	_openAccept()
	
func _openAccept():
	if (Input.is_action_just_pressed("ui_accept")):
		emit_signal("accept")
	
func _inventory():
	if (Input.is_action_just_pressed("ui_inventory") && inventoryOn == false):
		print("inventory On")
		
		callDialog("Status",1);
		get_tree().call_group("paper","queue_free")
		inventoryOn = true
		get_tree().paused = true
	elif (Input.is_action_just_pressed("ui_inventory") && inventoryOn == true):
		print("inventory off")
		get_tree().call_group("paper","queue_free")		
		inventoryOn = false
		get_tree().paused = false

	
func _move(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector * speed
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite.play("idle")
	move_and_collide(velocity * delta)
	
func callDialog(text,sec):
	Dialog.visible = true
	Dialog.position = Vector2($AnimatedSprite.position.x + 50,$AnimatedSprite.position.y - 70)
	$dialog/Label.text = text
	yield(get_tree().create_timer(sec), "timeout")
	Dialog.visible = false
	
func showSpacebar():
	$Spacebar.visible = true

func hideSpacebar():
	$Spacebar.visible = false
