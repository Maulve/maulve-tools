extends Node
class_name MTTemplateSetup

const STATE_PATH: String = "res://addons/maulve-tools/templates/StateTemplate.gd"

static func setup():
	
	var path = ProjectSettings.get_setting("editor/script_templates_search_path", "res://script_templates/") as String
	
	path.replace("\\", "/")
	
	if !path.ends_with("/"):
		path += "/"
	
	if !DirAccess.dir_exists_absolute(path):
		DirAccess.make_dir_absolute(path)
	
	save_file(path)

static func save_file(path):
	var _state_file = FileAccess.open(STATE_PATH, FileAccess.READ)
	var state_content = _state_file.get_as_text()
	_state_file.close()
	
	if !DirAccess.dir_exists_absolute(path + "State/"):
		DirAccess.make_dir_absolute(path + "State/")
	
	var state_template = FileAccess.open(path + "State/StateTemplate.gd", FileAccess.WRITE_READ)
	state_template.store_string(state_content)
	state_template.close()
