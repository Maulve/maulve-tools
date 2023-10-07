extends Node2D

@onready var saver: Saver = $Player/Saver

var data : Dictionary

func _ready() -> void:
	SaveManager.load()

func _on_save_pressed() -> void:
	SaveManager.save()


func _on_load_pressed() -> void:
	SaveManager.load()


func _on_reload_pressed() -> void:
	SaveManager.load(0, true)
