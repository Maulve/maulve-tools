class_name Cursor extends Sprite2D

# CUSTOMIZE THIS // Maulve

func _init():
	centered = false

func _input(event):
	if event is InputEventMouseMotion:
		position = event.position
		
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		visible = false
	else:
		visible = true
