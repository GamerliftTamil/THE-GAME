extends Control

@export_file("*.json") var d_file
signal dia_done
var dialogue = []
var current_dia_num = 0
var dia_active = false

func _ready():
	$NinePatchRect.visible = false
	
func start():
	if dia_active:
		return
	$NinePatchRect.visible =true
	dia_active = true 
	dialogue = load_dialog()
	current_dia_num = -1
	next_script()
	
func load_dialog():
	var file = FileAccess.open("res://1npc.json",FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
func _input(event):
	if !dia_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()

func next_script():
	current_dia_num += 1
	if current_dia_num >= len(dialogue):
		dia_active = false
		$NinePatchRect.visible = false
		emit_signal("dia_done")
		return
	$NinePatchRect/name.text = dialogue[current_dia_num]['name']
	$NinePatchRect/text.text = dialogue[current_dia_num]['text']

	
