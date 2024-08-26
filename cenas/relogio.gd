extends Area2D

@onready var control = $"../../HUD/Control"

func _on_body_entered(body):
	if body.name == "Player":
		print("pegou tempo")
		control.segundos += 20
		await $CollisionShape2D.call_deferred("queue_free")
		$kiwirelogio.play("coletadokiwi")
		await $kiwirelogio.animation_finished
		queue_free()
