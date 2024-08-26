extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_body_entered(body):
	print("abacaxi")
	if body.name == "Player":
		Global.pontos += 3
		await $CollisionShape2Daba.call_deferred("queue_free")
		$abacaxi.play("coletado.aba")
		await $abacaxi.animation_finished
		print(Global.pontos)
		queue_free()
	
