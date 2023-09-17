@tool
extends EditorPlugin

@export var version = 0.1

func _init():
	var is_editor: bool = Engine.is_editor_hint()
	if is_editor:
		add_autoload_singleton("VideoManager", "res://addons/maulve-tools/autoload/VideoManager.gd")
		add_autoload_singleton("AudioManager", "res://addons/maulve-tools/autoload/AudioManager.gd")
		add_autoload_singleton("SaveManager", "res://addons/maulve-tools/autoload/SaveManager.gd")
		add_autoload_singleton("GlobalSignal", "res://addons/maulve-tools/autoload/GlobalSignal.gd")
		add_autoload_singleton("GlobalStorage", "res://addons/maulve-tools/autoload/GlobalStorage.gd")
		add_autoload_singleton("CollectableManager", "res://maulve-tools/nodot/autoload/CollectableManager.gd")
		add_autoload_singleton("InputManager", "res://addons/maulve-tools/autoload/InputManager.gd")
		add_autoload_singleton("DebugManager", "res://addons/maulve-tools/autoload/DebugManager.gd")
		add_autoload_singleton("Pause", "res://addons/maulve-tools/autoload/Pause.gd")
		add_autoload_singleton("TimeScale", "res://addons/maulve-tools/autoload/TimeScale.gd")
