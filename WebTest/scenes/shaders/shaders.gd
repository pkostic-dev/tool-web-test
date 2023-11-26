extends Control

var scene_main = load("res://scenes/main/main.tscn") as PackedScene
var shaders_loaded:bool = false

@export var shader_material_list:ShaderMaterialList

@onready var shader_progress_bar = %ShaderProgressBar
@onready var shader_loading = %ShaderLoading
@onready var shaders = %Shaders
@onready var loaded_shaders = %LoadedShaders

func _ready():
	if shader_material_list:
		var steps = shader_material_list.shader_material_list.size()
		print(steps)
		var step = 100.0 / steps
		print(step)
		for shader_material in shader_material_list.shader_material_list:
			print("Compiling shader " + shader_material.resource_name)
			await load_shader(shader_material)
			await get_tree().create_timer(0.01).timeout
			print("Done")
			shader_progress_bar.value += step
			print(shader_progress_bar.value + " %")


func load_shader(shader_material:ShaderMaterial):
	var color_rect = ColorRect.new()
	color_rect.material = shader_material
	color_rect.custom_minimum_size = Vector2(20, 20)
	color_rect.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	loaded_shaders.add_child(color_rect)

func _on_back_pressed():
	get_tree().change_scene_to_packed(scene_main)


func _on_shader_progress_bar_value_changed(value):
	if value > 99.0:
		shader_loading.visible = false
		shaders.visible = true
