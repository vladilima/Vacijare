extends Node2D

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://menu/menuInicial.tscn")

func _ready():
	if not Audio.vol_on:
		$AudioStreamPlayer.volume_db = -2000000
