extends Area3D


signal minusCollected
func _ready():
	pass

func _physics_process(_delta):
	rotate_y(deg_to_rad(3))
	
	

func _on_body_entered(body):
	if body.name == "CharacterBody3D":
		$Timer.start()


func _on_timer_timeout():
	emit_signal("minusCollected")
	queue_free()
