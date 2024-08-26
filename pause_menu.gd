extends CanvasLayer


var game_paused = false
func _ready():
	visible = false
	



func _on_quit_pressed():
	get_tree().quit()


func _on_voltar_pressed():
	get_tree().paused = false 
	visible = false
	
	
	
func _on_reiniciar_pressed():
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://cenas/level.tscn")

func _unhandled_input(event):
	if  event.is_action_pressed("Pause"):
		game_paused = !game_paused
		get_tree().paused = game_paused
		visible = game_paused
		
		
