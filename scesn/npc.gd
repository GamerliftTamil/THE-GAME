extends CharacterBody2D
const speed = 20
var current_state = IDEL

var is_chatting = false

var player
var player_in_chat_zone 
enum{
	IDEL,
	NEW_DIR,
	MOVE
}
func _ready():
	randomize()
func _process(delta):
	if current_state == 0 or current_state ==1:
		$AnimatedSprite2D.play("idel")
	if Input.is_action_pressed("chat"):

		$dialoge.start()
		is_chatting =true
func _on_chat_body_entered(body): 
	if body.has_method("player"):
		player = body 
		player_in_chat_zone = true
	
	



func _on_chat_body_exited(body):
	if body.has_method("player"):
		player_in_chat_zone = false


func _on_dialoge_dia_done() -> void:
	is_chatting = false
