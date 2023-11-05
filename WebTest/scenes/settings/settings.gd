extends Control

var scene_main = load("res://scenes/main/main.tscn") as PackedScene

@onready var viewport_width = %ViewportWidth as LineEdit
@onready var viewport_height = %ViewportHeight as LineEdit
@onready var window_mode = %WindowMode as OptionButton
@onready var stretch_mode = %StretchMode as OptionButton
@onready var aspect = %Aspect as OptionButton
@onready var scale_range = %ScaleRange as HSlider
@onready var scale_value = %ScaleValue as LineEdit
@onready var scale_mode = %ScaleMode as OptionButton

@onready var tab_container = %TabContainer as TabContainer


enum WindowMode {
	WINDOWED,
	MINIMIZED,
	MAXIMIZED,
	FULLSCREEN,
	EXCLUSIVE_FULLSCREEN,
}
enum StretchMode {
	DISABLED,
	CANVAS_ITEMS,
	VIEWPORT,
}

enum ScaleMode {
	FRACTIONAL,
	INTEGER,
}

enum Aspect {
	IGNORE,
	KEEP,
	KEEP_WIDTH,
	KEEP_HEIGHT,
	EXPAND,
}

var original_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var originial_height = ProjectSettings.get_setting("display/window/size/viewport_height")

func _ready():
	# NOTE : Update control nodes
	viewport_width.text = str(DisplayServer.window_get_size().x)
	viewport_height.text = str(DisplayServer.window_get_size().y)
	window_mode.selected = DisplayServer.window_get_mode()
	stretch_mode.selected = get_tree().root.content_scale_mode
	aspect.selected = get_tree().root.content_scale_aspect
	scale_range.value = get_tree().root.content_scale_factor
	scale_value.text = str(get_tree().root.content_scale_factor)
	scale_mode.selected = get_tree().root.content_scale_stretch


func _process(_delta):
	if Input.is_action_just_pressed(&"reset"):
		reset()


func reset():
	reset_viewport_size()
	reset_window_mode()
	reset_stretch_mode()
	reset_aspect()
	reset_scale_factor()
	reset_scale_mode()
	_ready()


func reset_viewport_size():
	var window_size = Vector2i(original_width, originial_height)
	DisplayServer.window_set_size(window_size)


func reset_window_mode():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func reset_stretch_mode():
	get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_DISABLED


func reset_aspect():
	get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP


func reset_scale_factor():
	get_tree().root.content_scale_factor = 1.0


func reset_scale_mode():
	get_tree().root.content_scale_stretch = Window.CONTENT_SCALE_STRETCH_INTEGER

func _on_back_pressed():
	get_tree().change_scene_to_packed(scene_main)


func _on_viewport_width_text_submitted(new_text):
	var window_size = Vector2i(int(new_text), DisplayServer.window_get_size().y)
	DisplayServer.window_set_size(window_size)


func _on_viewport_height_text_submitted(new_text):
	var window_size = Vector2i(DisplayServer.window_get_size().x, int(new_text))
	DisplayServer.window_set_size(window_size)


func _on_mode_item_selected(index):
	match(index):
		WindowMode.WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		WindowMode.MINIMIZED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MINIMIZED)
		WindowMode.MAXIMIZED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		WindowMode.FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		WindowMode.EXCLUSIVE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)

# NOTE : Stretch -> Mode
func _on_stretch_mode_item_selected(index):
	match(index):
		StretchMode.DISABLED:
			get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_DISABLED
		StretchMode.CANVAS_ITEMS:
			get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS
		StretchMode.VIEWPORT:
			get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_VIEWPORT


func _on_scale_range_value_changed(value):
	scale_value.text = str(value)
	get_tree().root.content_scale_factor = float(value)


func _on_scale_value_text_submitted(new_text):
	var scale_factor = int(new_text)
	if typeof(scale_factor) == TYPE_INT:
		scale_range.value = scale_factor
		get_tree().root.content_scale_factor = float(scale_factor)

# NOTE : Stretch -> Scale Mode
func _on_scale_mode_item_selected(index):
	match(index):
		ScaleMode.FRACTIONAL:
			get_tree().root.content_scale_stretch = Window.CONTENT_SCALE_STRETCH_FRACTIONAL
		ScaleMode.INTEGER:
			get_tree().root.content_scale_stretch = Window.CONTENT_SCALE_STRETCH_INTEGER


func _on_aspect_item_selected(index):
	match(index):
		Aspect.IGNORE:
			get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_IGNORE
		Aspect.KEEP:
			get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP
		Aspect.KEEP_WIDTH:
			get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP_WIDTH
		Aspect.KEEP_HEIGHT:
			get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP_HEIGHT
		Aspect.EXPAND:
			get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_EXPAND
