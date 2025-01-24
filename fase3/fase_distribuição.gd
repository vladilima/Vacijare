extends Node2D

var win = false


func _ready():
	if not Audio.vol_on:
		$AudioStreamPlayer.volume_db = -2000000
		$AudioStreamPlayer2.volume_db = -2000000
		$AudioStreamPlayer3.volume_db = -2000000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$TimerTexto.text = String.num($Timer.time_left, 0)
	$TimerBar.value = $Timer.time_left * 20
	
	
	if not win and $"ProduçãoBar".value <= 60 and $"ProduçãoBar".value >= 40:
		if $DemandaBar.value <= 60 and $DemandaBar.value >= 40:
			if $Timer.is_stopped():
				$Timer.start()
		else:
			$Timer.stop()
	else:
		$Timer.stop()
	
	
	
	for Van in $Vans.get_children():
		if Van.global_position.x >= 1035:
			Van.queue_free()
			$DemandaBar.value += 5
		else:
			Van.global_position.x += 8


func _on_van_button_pressed():
	if $"ProduçãoBar".value < 5:
		return
	
	$"ProduçãoBar".value -= 5
	
	var new_van = preload("res://fase3/Van.tscn").instantiate()
	$Vans.add_child(new_van)
	
	# Randomiza a cor da van
	var van_color = randi() % 3
	match van_color:
		0:
			new_van.texture = preload("res://fase3/sprites/fase 3 van verde vacinada.png")
		1:
			new_van.texture = preload("res://fase3/sprites/fase 3 van azul vacinada.png")
		2:
			new_van.texture = preload("res://fase3/sprites/fase 3 van amarela vacinada.png")
	
	new_van.global_position = $VanSpawner.global_position


func _on_producao_timer_timeout():
	$"ProduçãoBar".value += .625


func _on_demanda_timer_timeout():
	$DemandaBar.value -= .625


# Começa os timer tudo
func _on_texto_button_pressed():
	$AnimationPlayer.play("idle")
	
	$"ProduçãoBar/ProducaoTimer".start()
	$DemandaBar/DemandaTimer.start()


func _on_timer_timeout():
	win = true
	$AnimationPlayer.play("win")


func _on_win_button_pressed():
	get_tree().change_scene_to_file("res://creditos/creditos.tscn")


func _on_menuBOTAO_pressed():
	get_tree().change_scene_to_file("res://menu/menuInicial.tscn")
