extends CharacterBody2D
var health = 100 
var speed =40
var player_chase = false
var player = null

func _physics_process(delta):

	if player_chase:
		position += (player.position - position)/speed
		if player.position.x < position.x :
			$AnimatedSprite2D.play("walking_left")
		elif  player.position.x > position.x :
			$AnimatedSprite2D.play("walking_right")
	else:
		$AnimatedSprite2D.play("idel")




func _on_detection_area_body_entered(body):
	print("something entered")
	player = body
	player_chase = true
	
	

func _on_detection_area_body_exited(body):
	player =null
	player_chase = false
	
	
	
	
