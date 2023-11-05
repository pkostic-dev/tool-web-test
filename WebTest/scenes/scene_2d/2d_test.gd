extends Node2D

var scene_main = load("res://scenes/main/main.tscn") as PackedScene
@onready var camera_2d = $Camera2D as Camera2D
@onready var camera_info = %CameraInfo as RichTextLabel

func _on_back_pressed():
	get_tree().change_scene_to_packed(scene_main)


func _on_camera_2d_camera_info_changed(camera_speed, camera_zoom):
	camera_info.text = "camera_speed = " + str(camera_speed)
	camera_info.text += "\ncamera_zoom = " + str(camera_zoom)
