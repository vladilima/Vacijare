extends Node2D

var vacina = 0

var cor_verde = Color8(80, 172, 28)
var cor_azul = Color8(64, 156, 188)
var cor_amarela = Color8(255, 220, 84)
var cor_atual

# Valores adicionados no frasco atual
var verde_atual = 0
var azul_atual = 0
var amarelo_atual = 0

# Valores alvo para o frasco atual
var verde_target = 0
var azul_target = 0
var amarelo_target = 0

# RECEITAS DAS VACINAS
var covid_receita = [1,3,1] # Vermelho, Rosa, Laranja
var triplice_receita = [2,1,2]
var gripe_receita = [3,0,2]


func _ready():
	if not Audio.vol_on:
		$AudioStreamPlayer.volume_db = -2000000
		$AudioStreamPlayer2.volume_db = -2000000
		$AudioStreamPlayer3.volume_db = -2000000
		$AudioStreamPlayer4.volume_db = -2000000
		$AudioStreamPlayer2D.volume_db = -2000000
	
	proxima_vacina()


func _on_verde_button_pressed():
	if $VerdeProgress.value > 0:
		$VerdeProgress.value -= 1
		verde_atual += 1
		atualizar_progresso()


func _on_azul_button_pressed():
	if $AzulProgress.value > 0:
		$AzulProgress.value -= 1
		azul_atual += 1
		atualizar_progresso()


func _on_amarelo_button_pressed():
	if $AmareloProgress.value > 0:
		$AmareloProgress.value -= 1
		amarelo_atual += 1
		atualizar_progresso()


func atualizar_progresso():
	var proximidade_anterior = $VacinaProgress.value
	
	
	var verde_proximity = absi(verde_target - verde_atual)
	var azul_proximity = absi(azul_target - azul_atual)
	var amarelo_proximity = absi(amarelo_target - amarelo_atual)
	
	print(verde_proximity)
	print(azul_proximity)
	print(amarelo_proximity)
	
	
	
	var proximidade_atual = $VacinaProgress.max_value - verde_proximity - azul_proximity - amarelo_proximity
	$VacinaProgress.value = proximidade_atual
	
	print("Proximidade:")
	print(proximidade_atual)
	
	if proximidade_anterior < proximidade_atual:
		$frasco/liquido.modulate = $frasco/liquido.modulate.lerp(cor_atual, 1 / $VacinaProgress.max_value)


func proxima_vacina():
	# Sets the color targets for the vaccine
	match vacina:
		0:
			cor_atual = cor_verde
			verde_target = covid_receita[0]
			azul_target = covid_receita[1]
			amarelo_target = covid_receita[2]
		1:
			cor_atual = cor_azul
			verde_target = triplice_receita[0]
			azul_target = triplice_receita[1]
			amarelo_target = triplice_receita[2]
		2:
			cor_atual = cor_amarela
			verde_target = gripe_receita[0]
			azul_target = gripe_receita[1]
			amarelo_target = gripe_receita[2]
		3:
			print("PORRA")
			$AnimationPlayer2.play("win")
			return
	
	
	
	$VacinaProgress.max_value = verde_target + azul_target + amarelo_target
	$VacinaProgress.value = 0
	
	print("Verde: ", verde_target)
	print("Azul: ", azul_target)
	print("Amarelo: ", amarelo_target)
	print($VacinaProgress.max_value)
	
	vacina += 1
	
	verde_atual = 0
	azul_atual = 0
	amarelo_atual = 0


func _on_proxima_vacina_pressed():
	$frasco/liquido.modulate = Color("fff0f3")
	if $VacinaProgress.value == $VacinaProgress.max_value:
		proxima_vacina()
		$AnimationPlayer.play("right")
	else:
		$VerdeProgress.value = 8
		$AzulProgress.value = 8
		$AmareloProgress.value = 8
		verde_atual = 0
		azul_atual = 0
		amarelo_atual = 0
		
		$AnimationPlayer.play("wrong")


func _on_botao_fala_pressed():
	$AnimationPlayer.play("idle")


func _on_ajuda_do_fritz_pressed():
	$AnimationPlayer.play("help")


func _on_botao_fala_2_pressed():
	$AnimationPlayer.play("idle")


func _on_botao_fala_win_pressed():
	get_tree().change_scene_to_file("res://fase3/fase_distribuição.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu/menuInicial.tscn")
