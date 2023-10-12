@tool
extends Sprite2D

var enable: bool = false


enum CURSOR_MODE {
	Pointer,
	Hand
}

##region Textures
var texture_pointer: Texture2D = Texture2D.new()
var texture_hand: Texture2D = Texture2D.new()
##endregion


var mode: int = Input.mouse_mode:
	set(new):
		mode = new
		_update_texture()

func _init() -> void:
	visible = !Engine.is_editor_hint()
	texture = ProjectSettings.get_setting("display/mouse_cursor/custom_image", Texture2D.new())
	
##region Exposed Functions

func set_mode(new_mode: int):
	mode = new_mode

func hide():
	visible = false

func show():
	visible = true

##endregion

func _input(event):
	if !Engine.is_editor_hint():
		
		if event is InputEventMouseMotion:
			position = event.position
		
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			visible = false
		else:
			visible = true

func _update_texture():
	match mode:
		0:
			texture = texture_pointer
		1:
			texture = texture_hand
