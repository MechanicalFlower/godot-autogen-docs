static func replace_variable(template: String, placeholder_key: String, value: Variant) -> String:
	# Check if the value is an Array
	# if value is Array:
	# 	print("Attempt to replace with an array like a variable, use for-loops instead.")
	# 	return ""

	# If the value is a Dictionary, delegate to render_dictionary
	if value is Dictionary:
		return render_dictionary(template, placeholder_key, value)

	# Replace the placeholder in the template with the string representation of the value
	var placeholder = "{{ %s }}" % placeholder_key
	return template.replace(placeholder, str(value))


## Iterate through the keys in the dictionary and recursively replace placeholders
static func render_dictionary(
	template: String, placeholder_key: String, data: Dictionary
) -> String:
	for key in data.keys():
		var placeholder_subkey = "%s.%s" % [placeholder_key, key]
		template = replace_variable(template, placeholder_subkey, data[key])
	return template


## Represents a for-loop block with relevant information
class ForLoopBlock:
	var forloop_block: String
	var data_key: String
	var loop_variable: String
	var loop_content: String

	func _init(flb: String, dk: String, lv: String, lc: String):
		forloop_block = flb
		data_key = dk
		loop_variable = lv
		loop_content = lc


class Token:
	var text: String

	func _init(token: String):
		text = token

	## Convert a template and regex match to a Token instance
	static func convert(template: String, regex_match: RegExMatch) -> Token:
		var token := template.substr(
			regex_match.get_start(), regex_match.get_end() - regex_match.get_start()
		)

		# Identify ForToken or EndForToken based on the token content
		if token.begins_with("{% for"):
			return ForToken.new(token)
		if token == "{% endfor %}":
			return EndForToken.new(token)

		return Token.new(token)


# Represents a {% for %} token
class ForToken:
	extends Token


# Represents a {% endfor %} token
class EndForToken:
	extends Token


## Tokenizes the template into individual elements for processing
static func tokenize_template(template: String, placeholder_key: String = "") -> Array:
	var tokens = []

	var regex = RegEx.new()

	var err
	if placeholder_key == "":
		err = regex.compile(
			r"{% for (?<loop_variable>\w+) in (?<data_key>(\w|\.)+) %}|{% endfor %}"
		)
	else:
		err = regex.compile(
			(
				r"{% for (?<loop_variable>\w+) in "
				+ placeholder_key
				+ r"\.(?<data_key>\w+) %}|{% endfor %}"
			)
		)

	if err != OK or not regex.is_valid():
		printerr("Failed to compile the template regex.")
		return tokens

	var i := 0
	var regex_matchs := regex.search_all(template)
	while i < regex_matchs.size():
		var regex_match = regex_matchs[i]
		var token := Token.convert(template, regex_match)

		if token is ForToken:
			# Find the corresponding endfor
			var level = 1
			i += 1

			var sub_regex_match: RegExMatch
			while level > 0 and i < regex_matchs.size():
				sub_regex_match = regex_matchs[i]
				var subtoken := Token.convert(template, sub_regex_match)

				if subtoken is ForToken:
					level += 1
				elif subtoken is EndForToken:
					level -= 1
				i += 1

			assert(level == 0, "Missing endfor!")

			var forloop_block := template.substr(
				regex_match.get_start(), sub_regex_match.get_end() - regex_match.get_start()
			)

			# Extract capture groups from the regex match
			var loop_variable := regex_match.get_string("loop_variable")
			var data_key := regex_match.get_string("data_key")
			var loop_content := template.substr(
				regex_match.get_end(), sub_regex_match.get_start() - regex_match.get_end()
			)

			(
				tokens
				. append(
					(
						ForLoopBlock
						. new(
							forloop_block,
							data_key,
							loop_variable,
							loop_content,
						)
					)
				)
			)

		elif token is EndForToken:
			assert(false, "endfor without forloop!")

		else:
			printerr("Unknown token: %s" % token)

	return tokens


## Renders for-loops in the template with the provided data
static func render_forloops(
	template: String, data: Dictionary, placeholder_key: String = ""
) -> String:
	# Tokenize the template into individual elements
	var tokens = tokenize_template(template, placeholder_key)

	var i := 0
	while i < tokens.size():
		var token = tokens[i]

		# Process the loop_content
		template = _render_forloops(
			template,
			data,
			token.forloop_block,
			token.data_key,
			token.loop_variable,
			token.loop_content
		)

		i += 1

	return template


static func _render_forloops(
	template: String,
	data: Dictionary,
	forloops_block: String,
	data_key: String,
	loop_variable: String,
	loop_content: String
) -> String:
	var loop_result = ""

	# Check if the data dictionary has the specified key
	if data.has(data_key):
		# Iterate over each item in the data array for the specified key
		for item in data[data_key]:
			# Check if the item is a Dictionary or an object with a 'to_dict' method
			var item_data = {}
			if item is Dictionary:
				item_data = item
			elif item.has_method("to_dict"):
				item_data = item.to_dict()
			else:
				printerr("Object doesn't have 'to_dict' method. Skipping in loop.")

			# Render the loop content with the data of the current item
			loop_result += render_dictionary(loop_content, loop_variable, item_data)

			loop_result = render_forloops(loop_result, item_data, loop_variable)

	# Replace the entire loop block with the rendered result
	template = template.replace(forloops_block, loop_result)

	return template


## Define a static function to render a template with data
static func render_template(template: String, data: Dictionary) -> String:
	# Replace variables in the template with their corresponding values
	for key in data.keys():
		template = replace_variable(template, key, data[key])

	template = render_forloops(template, data)

	# Return the final result after processing variables and loops
	return template
