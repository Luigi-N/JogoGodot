extends Area2D
var pontos = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_body_entered(body):
	print("melancia")
	if body.name == "Player":
		Global.pontos += 1
		await $CollisionShape2D.call_deferred("queue_free")
		$melancia.play("coletado")
		await $melancia.animation_finished
		print(Global.pontos)
	
		
			
