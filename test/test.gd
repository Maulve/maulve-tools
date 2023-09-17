extends Control

@onready var saver = $TextEdit/Saver as Saver

var saved_values : Dictionary

func _ready() -> void:
	SaveManager.load()
	
	$Save.pressed.connect(_save_pressed)
	$Load.pressed.connect(_load_pressed)

func _save_pressed():
	saved_values = saver.save()
	SaveManager.set_value("text", saved_values["text"])
	SaveManager.save()

func _load_pressed():
	saver.load(saved_values)
