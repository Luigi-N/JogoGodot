extends CharacterBody2D 


const SPEED = 300.0 # Velocidade que o player anda 
const JUMP_VELOCITY = -400.0 #velocidade do pulo do player
var estaPulando = false # para confirmar se está pulando
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Pega a gravidade padrão das configurações
# e sintoniza com o player  
var is_takingdamage
var is_dead 
var vida = 5
#vida do player 



signal player_stats_changed 
signal gameover 
signal morreu

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta # ativa a gravidade se o player não estiver no chão

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and !is_takingdamage: # linha que configura o pulo funcionar 
		velocity.y = JUMP_VELOCITY
		estaPulando=true
	elif is_on_floor():
		estaPulando=false 

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction and !is_takingdamage:
		velocity.x = direction * SPEED #linha que configura o personagem andar para esquerda e para direita
		$Animacao.scale.x = direction  # configura  a velocidade do personagem
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 0.88)
		
		##Animação
	if !is_takingdamage:
		if is_on_floor():#se tá no chão
			if estaPulando: #se está pulando
				print(estaPulando)
				$Animacao.play("jump")
			elif direction !=0:#em movimento 
					$Animacao.play("run")
			elif direction ==0:#parado
					$Animacao.play("idle")
		else: #nao está no chão
			if velocity.y < 0:
					$Animacao.play("jump")
			else:
					$Animacao.play("fall")
		
	move_and_slide()
	
func _levouDano(dano):
	is_takingdamage = true
	velocity.x = -400
	
	$Animacao.play("hitanim")
	await $Animacao.animation_finished
	
	is_takingdamage = false
	
	vida -= dano
	print("vida:",vida)
	
	if vida <= 0:
		_morreu()
		
func _morreu():
	is_dead = true
	emit_signal("morreu")

