extends Control

var scene_main = load("res://scenes/main/main.tscn") as PackedScene

func _on_back_pressed():
	get_tree().change_scene_to_packed(scene_main)
