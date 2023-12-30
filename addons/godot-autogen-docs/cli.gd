@tool
extends SceneTree

const TEMPLATE_DIRECTORY := "res://addons/godot-autogen-docs/templates/"

const TemplateEngine := preload("res://addons/godot-autogen-docs/template_engine.gd")
const Collector := preload("res://addons/godot-autogen-docs/collector.gd")

# Default configuration

## A list of directories to collect files from.
var directories := ["res://"]

## If true, explore each directory recursively
var is_recursive := true

## A list of patterns to filter files.
var patterns := ["*.gd"]

## A directory for saving files.
var output_directory := "res://docs/"


func _process(_delta) -> bool:
	var args = OS.get_cmdline_args()

	# Remove unwanted args
	args.remove_at(args.find("--editor"))
	args.remove_at(args.find("--script"))
	args.remove_at(args.find("addons/godot-autogen-docs/cli.gd"))

	if args.size() > 0:
		match args[0]:
			"help":
				print(
					(
						"""
Usage:
	godot --editor --headless --quit --script %s <command> [<options> ...]

Commands:
	help			Display this text
	markdown		Export documentation to markdown
	readthedocs		Export documentation to markdown compatible with the readthedocs theme

Options:
	-ddir			Comma delimited list of directories to collect files from
	-doutdir		A directory for saving documentation files

"""
						% get_script().get_path()
					)
				)
			"markdown", "readthedocs":
				var template = args[0]
				var template_path = TEMPLATE_DIRECTORY + "%s.template.md" % template

				if not FileAccess.file_exists(template_path):
					print("Unable to find the %s template." % template)

				# Find options
				for i in range(1, args.size()):
					var option = args[i].split("=")
					if option.size() == 2:
						if option[0] == "-ddir":
							directories = option[1].split(",")
						elif option[0] == "-doutdir":
							output_directory = option[1]
						else:
							print("Unknown option %s" % option[0])
					else:
						print("Invalid argument %s" % args[i])

				var reference := generate_reference()
				render(reference, template_path, output_directory)
			_:
				print("Unknown command %s" % args[0])

	return true


func generate_reference() -> Dictionary:
	var collector := Collector.new()
	var files := PackedStringArray()
	for dirpath in directories:
		files.append_array(collector.find_files(dirpath, patterns, is_recursive))
	return collector.get_reference(files)


func load_file(path: String) -> String:
	var file := FileAccess.open(path, FileAccess.READ)
	var str := file.get_as_text()
	file.close()
	return str


func save_file(content: String, path: String) -> void:
	var file := FileAccess.open(path, FileAccess.WRITE)
	file.store_string(content)
	file.close()


func render(reference: Dictionary, template_path: String, output_dirpath: String) -> void:
	# Load template
	var template_str := load_file(template_path)

	for cls in reference["classes"]:
		# Render the template
		var content = TemplateEngine.render_template(template_str, cls)

		# Create the file
		save_file(content, output_dirpath + cls["name"] + ".md")
