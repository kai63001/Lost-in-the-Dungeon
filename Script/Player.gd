extends KinematicBody2D

export var speed = 100

var velocity = Vector2.ZERO
onready var Dialog = $dialog

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector != Vector2.ZERO:
		callDialog()
		velocity = input_vector * speed
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite.play("idle")
		
	
	move_and_collide(velocity * delta)
	
func callDialog():
	Dialog.visible = true
	Dialog.position = Vector2($AnimatedSprite.position.x + 50,$AnimatedSprite.position.y - 70)
	$dialog/Label.text = "Where the fuck"
