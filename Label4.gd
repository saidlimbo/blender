extends Label


var nol = 0
var plus = nol
var minus = 0


func _ready():
	text = str(plus)
	if plus < 0:
		get_tree().change_scene_to_file("res://menu/menu.tscn")

func _on_plus_plus_collected():
	plus = plus + 1
	_ready()


func _on_minus_minus_collected():
	plus = plus - 1
	_ready()


func _on_minus_2_minus_collected():
	pass # Replace with function body.
