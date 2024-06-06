extends Label


var nol = 0
var minus = nol

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(minus)




func _on_minus_minus_collected():
	minus = minus + 1
	_ready()


func _on_minus_2_minus_collected():
	pass # Replace with function body.
