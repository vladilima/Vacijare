extends Control

var cidade = 0

# Panfletos colocados nos postes
var covid_atual = 0
var triplic_atual = 0
var gripe_atual = 0

# Panfletos alvo para os postes na cidade
var covid_target = 0
var triplic_target = 0
var gripe_target = 0

func _ready():
	if not Audio.vol_on:
		$AudioStreamPlayer.volume_db = -2000000
	
func atualizar_progresso():
	verificarProgresso()
	var covid_proximity = absi(covid_target - covid_atual)
	var triplic_proximity = absi(triplic_target - triplic_atual)
	var gripe_proximity = absi(gripe_target - gripe_atual)


func _on_button_poste1_pressed():
	if $Covid_ProgressBar.value < 100:
		$Covid_ProgressBar.value += 25
		covid_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste1/PlanfletoCovid2.visible = true
	$CIDADE1/Poste1/Button_poste1.visible = false


func _on_button_poste2_pressed():
	if $Gripe_ProgressBar.value < 100:
		$Gripe_ProgressBar.value += 25
		gripe_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste2/PanfletoGripe.visible = true
	$CIDADE1/Poste2/Button_poste2.visible = false



func _on_button_poste_3_pressed():
	if $Triplic_ProgressBar.value < 100:
		$Triplic_ProgressBar.value += 25
		triplic_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste3/PanfletoTriplic.visible = true
	$CIDADE1/Poste3/Button_poste3.visible = false


func _on_button_poste_4_pressed():
	if $Covid_ProgressBar.value < 100:
		$Covid_ProgressBar.value += 25
		covid_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste4/PlanfletoCovid2.visible = true
	$CIDADE1/Poste4/Button_poste4.visible = false


func _on_button_poste_5_pressed():
	if $Triplic_ProgressBar.value < 100:
		$Triplic_ProgressBar.value += 25
		triplic_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste5/PanfletoTriplic.visible = true
	$CIDADE1/Poste5/Button_poste5.visible = false


func _on_button_poste_6_pressed():
	if $Gripe_ProgressBar.value < 100:
		$Gripe_ProgressBar.value += 25
		gripe_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste6/PanfletoGripe.visible = true
	$CIDADE1/Poste6/Button_poste6.visible = false


func _on_button_7_gripe_pressed():
	if $Gripe_ProgressBar.value < 100:
		$Gripe_ProgressBar.value += 25
		gripe_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste7E/PanfletoGripe.visible = true
	$CIDADE1/Poste7E/Button7_gripe.visible = false


func _on_button_7_triplic_pressed():
	if $Triplic_ProgressBar.value < 100:
		$Triplic_ProgressBar.value += 25
		triplic_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste7E/PanfletoTriplic.visible = true
	$CIDADE1/Poste7E/Button7_triplic.visible = false


func _on_button_8_covid_pressed():
	if $Covid_ProgressBar.value < 100:
		$Covid_ProgressBar.value += 25
		covid_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste8E/PlanfletoCovid.visible = true
	$CIDADE1/Poste8E/Button8_covid.visible = false


func _on_button_8_triplic_pressed():
	if $Triplic_ProgressBar.value < 100:
		$Triplic_ProgressBar.value += 25
		triplic_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste8E/PanfletoTriplic.visible = true
	$CIDADE1/Poste8E/Button8_triplic.visible = false


func _on_button_9_gripe_pressed():
	if $Gripe_ProgressBar.value < 100:
		$Gripe_ProgressBar.value += 25
		gripe_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste9E/PanfletoGripe.visible = true
	$CIDADE1/Poste9E/Button9_gripe.visible = false


func _on_button_9_covid_pressed():
	if $Covid_ProgressBar.value < 100:
		$Covid_ProgressBar.value += 25
		covid_atual += 1
		atualizar_progresso()
	$CIDADE1/Poste9E/PlanfletoCovid.visible = true
	$CIDADE1/Poste9E/Button9_covid.visible = false


func encerrarJogo():
	get_tree().change_scene_to_file("res://fase2/fase_desenvolvimento.tscn")

func verificarProgresso():
	if covid_atual >= 4 && gripe_atual >= 4 && triplic_atual >= 4:
		encerrarJogo()


func _on_menuBUTAO_pressed():
	get_tree().change_scene_to_file("res://menu/menuInicial.tscn")
