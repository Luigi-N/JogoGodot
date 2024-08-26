extends CanvasLayer




func _on_continuar_pressed():
		get_tree().paused = false 
		get_tree().change_scene_to_file("res://cenas/level.tscn")
	
	


func _on_sair_pressed():
	get_tree().quit()
