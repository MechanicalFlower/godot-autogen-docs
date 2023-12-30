## Finds and generates a code reference from gdscript files.
@tool
extends SceneTree

var warnings_regex := RegEx.new()


func _init() -> void:
	var pattern := "^\\s?(warning-ignore(-all|):\\w+|warnings-disable)\\s*$"
	var error := warnings_regex.compile(pattern)
	if error != OK:
		printerr("Failed to compile '%s' to a regex pattern." % pattern)


## Returns a list of file paths found in the directory.
func find_files(
	dirpath := "", patterns := PackedStringArray(), is_recursive := false, _do_skip_hidden := true
) -> PackedStringArray:
	var file_paths := PackedStringArray()

	if not DirAccess.dir_exists_absolute(dirpath):
		printerr("The directory does not exist: %s" % dirpath)
		return file_paths

	var directory := DirAccess.open(dirpath)
	if directory == null:
		printerr("Could not open the following dirpath: %s" % dirpath)
		return file_paths

	directory.list_dir_begin()
	var file_name := directory.get_next()
	var subdirectories := PackedStringArray()
	while file_name != "":
		if file_name != "." and file_name != "..":
			if directory.current_is_dir() and is_recursive:
				var subdirectory := dirpath.path_join(file_name)
				file_paths.append_array(find_files(subdirectory, patterns, is_recursive))
			else:
				for pattern in patterns:
					if file_name.match(pattern):
						file_paths.append(dirpath.path_join(file_name))
		file_name = directory.get_next()

	directory.list_dir_end()
	return file_paths


## Saves text to a file.
func save_text(path := "", content := "") -> void:
	var dirpath := path.get_base_dir()
	var basename := path.get_file()
	if dirpath == null or dirpath.is_empty():
		printerr("Couldn't save: the path %s is invalid." % path)
		return
	if not basename.is_valid_filename():
		printerr("Couldn't save: the file name, %s, contains invalid characters." % basename)
		return

	if not DirAccess.dir_exists_absolute(dirpath):
		DirAccess.make_dir_absolute(dirpath)

	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(content)
	file.close()
	print("Saved data to %s" % path)


## Parses a list of GDScript files and returns a list of dictionaries with the
## code reference data.
##
## If `refresh_cache` is true, will refresh Godot's cache and get fresh symbols.
func get_reference(files := PackedStringArray(), refresh_cache := false) -> Dictionary:
	var version := "n/a"
	if ProjectSettings.has_setting("application/config/version"):
		version = ProjectSettings.get_setting("application/config/version")
	var data := {
		name = ProjectSettings.get_setting("application/config/name"),
		description = ProjectSettings.get_setting("application/config/description"),
		version = version,
		classes = []
	}
	var workspace = Engine.get_singleton("GDScriptLanguageProtocol").get_workspace()
	for file in files:
		if not file.ends_with(".gd"):
			continue
		if refresh_cache:
			workspace.parse_local_script(file)
		var symbols: Dictionary = workspace.generate_script_api(file)
		if symbols.has("name") and symbols["name"] == "":
			symbols["name"] = file.get_file()
		data["classes"].append(symbols)
	return data
