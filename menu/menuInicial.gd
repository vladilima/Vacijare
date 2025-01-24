extends Control

func _ready():
	$VBoxContainer/comecar.grab_focus()

func _on_comecar_pressed():
	get_tree().change_scene_to_file("res://introducao/tela1_introducao.tscn")


func _on_sair_pressed():
	get_tree().quit()


func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://fase 1/fases_controlador.tscn")


func _on_creditosssssss_pressed():
	get_tree().change_scene_to_file("res://creditos/creditos_menu.tscn")




func _on_mute_pressed():
	if Audio.vol_on:
		$AudioStreamPlayer.volume_db = -20000
		Audio.vol_on = false
	else:
		Audio.vol_on = true
		$AudioStreamPlayer.volume_db = -15
