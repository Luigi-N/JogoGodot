extends CanvasLayer

func _ready():
	visible = false 

func _process(delta):
	pass


func _on_ganhoureal_pressed():
	get_tree().quit()
