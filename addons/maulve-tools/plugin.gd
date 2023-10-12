@tool
extends EditorPlugin

@export var version: float = 0.1

func _init():
	if Engine.is_editor_hint():
		add_child(MTTemplateSetup.new())
		
		add_autoload_singleton("VideoManager", "res://addons/maulve-tools/autoload/VideoManager.gd")
		add_autoload_singleton("AudioManager", "res://addons/maulve-tools/autoload/AudioManager.gd")
		add_autoload_singleton("SaveManager", "res://addons/maulve-tools/autoload/SaveManager.gd")
		add_autoload_singleton("GlobalSignal", "res://addons/maulve-tools/autoload/GlobalSignal.gd")
		add_autoload_singleton("GlobalStorage", "res://addons/maulve-tools/autoload/GlobalStorage.gd")
		add_autoload_singleton("InputManager", "res://addons/maulve-tools/autoload/InputManager.gd")
		add_autoload_singleton("TimeScale", "res://addons/maulve-tools/autoload/TimeScale.gd")
		add_autoload_singleton("Cursor", "res://addons/maulve-tools/autoload/Cursor.gd")
