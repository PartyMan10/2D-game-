extends CharacterBody2D

const SPEED = 200
const GRAVITY = 800
const JUMP_FORCE = -400

func _physics_process(delta):
	velocity.y += GRAVITY * delta

	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * SPEED

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE

	move_and_slide()
