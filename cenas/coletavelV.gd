extends Area2D

@onready var player = $"../Player"



func _on_body_entered(body):
	print("maça")
	if body.name == "Player" :
		#await $"CollisionShapeMaça".call_deferred("queue_free")
		#$maça.play("coletado_maça")
		#await $maça.animation_finished
		player._levouDano(2)
		
		
		
		
