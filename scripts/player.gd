extends CharacterBody2D

var health = 200
var max_speed = 100
var accel = 800
var friction = 400
var input = Vector2.ZERO

var enemy_in_range = false



func _physics_process(delta):
	player_movement(delta)

	if enemy_in_range:
		print("enemy touching player")

func get_input():
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return input.normalized()

func player_movement(delta):
	input = get_input()

	if input == Vector2.ZERO:

		if velocity.x > 0:
			$AnimatedSprite2D.play("idel_right")
		elif velocity.x < 0:
			$AnimatedSprite2D.play("idel_left")
		elif velocity.y > 0:
			$AnimatedSprite2D.play("idel_down")
		elif velocity.y < 0:
			$AnimatedSprite2D.play("idel_up")

	else:
		if input.x > 0:
			$AnimatedSprite2D.play("walk_right")

		if input.x < 0:
			$AnimatedSprite2D.play("walk_left")

		if input.y > 0:
			$AnimatedSprite2D.play("walk_down")

		if input.y < 0:
			$AnimatedSprite2D.play("walk_up")

	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)

	move_and_slide()

func _ready():
	$player_hitbox.area_entered.connect(_on_area_entered)
	$player_hitbox.area_exited.connect(_on_area_exited)

func _on_area_entered(area):
	if area.get_parent().is_in_group("enemy"):
		print("enemy hitbox touched")

func _on_area_exited(area):
	print("enemy left")
