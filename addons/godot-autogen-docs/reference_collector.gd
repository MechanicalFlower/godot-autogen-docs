## Finds and generates a code reference from gdscript files.
##
## To use this tool:
##
## - Place this script and Collector.gd in your Godot project folder.
## - Open the script in the script editor.
## - Modify the properties below to control the tool's behavior.
## - Go to File -> Run to run the script in the editor.
@tool
class_name ReferenceCollector
extends EditorScript

var collector: SceneTree = load("res://addons/godot-autogen-docs/collector.gd").new()
## A list of directories to collect files from.
var directories := ["res://src"]
## If true, explore each directory recursively
var is_recursive := true
## A list of patterns to filter files.
var patterns := ["*.gd"]
## Output path to save the class reference.
var save_path := "res://reference.json"


func _run() -> void:
	var files := PackedStringArray()
	for dirpath in directories:
		files.append_array(collector.find_files(dirpath, patterns, is_recursive))
	var json: String = collector.print_pretty_json(collector.get_reference(files))
	collector.save_text(save_path, json)
