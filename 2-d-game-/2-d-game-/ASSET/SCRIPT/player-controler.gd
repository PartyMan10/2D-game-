extends CharacterBody2D

# Exported variables (optional tuning in the Inspector)
@export var speed := 300.0
@export var gravity := 1200.0
@export var jump_force := -500.0

func _physics_process(delta):
	# Apply gravity when not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta

	# Horizontal movement (works with arrows + WASD once mapped)
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	# Jump (space/enter by default, mapped to "ui_accept")
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force

	# Move with collisions
	move_and_slide()

	# Animations
	if direction != 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = direction < 0
	else:
		$AnimatedSprite2D.play("idle")
