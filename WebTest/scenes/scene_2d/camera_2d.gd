extends Camera2D

@export var camera_speed := 300
@export var camera_zoom := 1
@onready var camera_info = %CameraInfo as RichTextLabel

signal camera_info_changed(camera_speed, camera_zoom)


func _ready():
	camera_info.text = "camera_speed = " + str(camera_speed)
	camera_info.text += "\ncamera_zoom = " + str(camera_zoom)


func _process(delta):
	if Input.is_action_pressed(&"ui_left"):
		position.x -= camera_speed * delta
	if Input.is_action_pressed(&"ui_right"):
		position.x += camera_speed * delta
	if Input.is_action_pressed(&"ui_up"):
		position.y -= camera_speed * delta
	if Input.is_action_pressed(&"ui_down"):
		position.y += camera_speed * delta
	
	if Input.is_action_pressed(&"zoom_1"):
		camera_zoom = 1
		zoom = Vector2i(camera_zoom, camera_zoom)
		camera_info_changed.emit(camera_speed, camera_zoom)
	if Input.is_action_pressed(&"zoom_2"):
		camera_zoom = 2
		zoom = Vector2i(camera_zoom, camera_zoom)
		camera_info_changed.emit(camera_speed, camera_zoom)
	if Input.is_action_pressed(&"zoom_3"):
		camera_zoom = 3
		zoom = Vector2i(camera_zoom, camera_zoom)
		camera_info_changed.emit(camera_speed, camera_zoom)
	if Input.is_action_pressed(&"zoom_4"):
		camera_zoom = 4
		zoom = Vector2i(camera_zoom, camera_zoom)
		camera_info_changed.emit(camera_speed, camera_zoom)


func _input(event:InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			camera_speed -= int(camera_speed * 0.1)
			camera_speed = clampi(camera_speed, 1, 1000)
			camera_info_changed.emit(camera_speed, camera_zoom)
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			camera_speed += int(camera_speed * 0.3) + 1
			camera_speed = clampi(camera_speed, 1, 1000)
			camera_info_changed.emit(camera_speed, camera_zoom)
