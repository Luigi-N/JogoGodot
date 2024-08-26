extends Area2D

func _ready():
	pass
# Cald when the node enters the scene tree for the first time.
func _process(delta):
	pass

func _on_body_entered(body):
	print("laranja")
	if body.name == "Player":
		get_tree().change_scene_to_file("res://win_screen.tscn")
		await $CollisionShapePremio.call_deferred("queue_free")
		$laranja.play("coletadoPR")
		await $laranja.animation_finished
		queue_free()
