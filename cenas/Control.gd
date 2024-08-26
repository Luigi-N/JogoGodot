extends Control

@onready var timer_count = $MarginContainer/HBoxContainer2/timer_count as Label
@onready var item_cont =  $MarginContainer/HBoxContainer/item_coletavel as Label
@onready var timer_cont = $Timer_cont as Timer
@onready var  medidor_vida = $MarginContainer/HBoxContainer3/vida as Label


signal tempo_acabou#para recarregar o mundo

var minutos = 0 
var segundos = 0

#para limtar o tempo
@export_range(0,2) var min_padrao = 1 
@export_range(0,59) var seg_padrao = 0

func _ready():
	item_cont.text = str("%03d" % Global.pontos)#puxa o contador de melancia, o label e converte o global.pontos para TEXTO para ser vísivil na hud
	#str = STRING para texto. "%o3d" quer dizer que vão aparecer 3 valores, 000.
	timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)#isso aqui evita o hud de começar com 0000, e começa certinho com o tempo que voce escolheu
	
	medidor_vida.text = str("%4d" % Global.pontos)#"text"
	minutos = min_padrao
	segundos = seg_padrao
	
func _process(delta):
	item_cont.text = str("%03d" % Global.pontos)
	if minutos == 0 && segundos == 0: 
		emit_signal("tempo_acabou")#emite um sinal avisando que o tempo acabou
	
func _on_timer_cont_timeout():
	if segundos == 0:
		if minutos >0:
			minutos -=1
			segundos = 60
						
	segundos -=1
	
	timer_count.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)
