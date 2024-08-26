extends Node2D

@onready var player = $Player
@onready var control = $HUD/Control


func _on_ready():
	player.morreu.connect(_resetGame)
	control.tempo_acabou.connect(_resetGame)
	




func _resetGame():
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://game_over_menu.tscn")
	#get_tree().reload_current_scene()
	Global.pontos = 0
	


