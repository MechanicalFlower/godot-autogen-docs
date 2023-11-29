@tool
class_name Markdown
extends SceneTree


# Convert data to Markdown
static func convert_to_markdown(cls: Dictionary) -> String:
	var markdown_str: String = ""

	markdown_str += "# " + cls["name"] + "\n\n"
	markdown_str += cls["description"] + "\n\n"

	# Members
	if "members" in cls:
		markdown_str += "## Members\n\n"
		for member in cls["members"]:
			markdown_str += "### " + member["name"] + "\n"
			markdown_str += "- **Type:** " + member["data_type"] + "\n"
			markdown_str += "- **Description:** " + member["description"] + "\n\n"

	# Methods
	if "methods" in cls:
		markdown_str += "## Methods\n\n"
		for method in cls["methods"]:
			markdown_str += "### " + method["name"] + "\n"
			markdown_str += "- **Return Type:** " + method["return_type"] + "\n"
			markdown_str += "- **Description:** " + method["description"] + "\n\n"

	return markdown_str


func _init():
	# Load JSON data from external file
	var json_path := "res://reference.json"
	var file := FileAccess.open(json_path, FileAccess.READ)
	var json_str := file.get_as_text()
	file.close()

	# Parse JSON data
	var json := JSON.new()
	var error := json.parse(json_str)

	for cls in json.data["classes"]:
		# Convert Markdown
		var markdown_output = convert_to_markdown(cls)

		# Create the markdown file
		var markdown_path = "res://docs/dev-guide/api-ref/" + cls["name"] + ".md"
		file = FileAccess.open(markdown_path, FileAccess.WRITE)
		file.store_string(markdown_output)
		file.close()
