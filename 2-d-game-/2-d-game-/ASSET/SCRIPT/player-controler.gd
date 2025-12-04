extends CharacterBody2D

const SPEED = 200
const GRAVITY = 1200
const JUMP_FORCE = -400

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Horizontal movement
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE

	# Move with collisions
	move_and_slide()

	# Animations
	if direction != 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = direction < 0
	else:
		$AnimatedSprite2D.play("idle")
