## Finds and generates a code reference from gdscript files.
@tool
class_name ReferenceCollectorCli
extends SceneTree

var collector: SceneTree = load("res://addons/godot-autogen-docs/collector.gd").new()
## A list of directories to collect files from.
var directories := ["res://"]
## If true, explore each directory recursively
var is_recursive := true
## A list of patterns to filter files.
var patterns := ["*.gd"]


func _init() -> void:
	var files := PackedStringArray()
	for dirpath in directories:
		files.append_array(collector.find_files(dirpath, patterns, is_recursive))
	var json: String = collector.print_pretty_json(collector.get_reference(files))
	collector.save_text("res://reference.json", json)
