extends Control

var scene_2d_test = load("res://scenes/scene_2d/2d_test.tscn") as PackedScene
var scene_3d_test = load("res://scenes/scene_3d/3d_test.tscn") as PackedScene
var scene_settings = load("res://scenes/settings/settings.tscn") as PackedScene

func _on_2d_test_pressed():
	get_tree().change_scene_to_packed(scene_2d_test)


func _on_settings_pressed():
	get_tree().change_scene_to_packed(scene_settings)


func _on_3d_test_pressed():
	get_tree().change_scene_to_packed(scene_3d_test)
