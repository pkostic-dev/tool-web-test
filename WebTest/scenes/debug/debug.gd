extends CanvasLayer

@onready var text = $Text as RichTextLabel

func _ready():
	var debug_text = ""
	debug_text += "display/window/stretch/mode = " + ProjectSettings.get_setting("display/window/stretch/mode")
	text.text = debug_text
