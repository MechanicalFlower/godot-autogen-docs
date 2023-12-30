extends "res://addons/gut/test.gd"

const TemplateEngine := preload("res://addons/godot-autogen-docs/template_engine.gd")


func test_0001_render_template():
	var template = (
		"Hello, {{ name }}! You are {{ age }} years old.\n"
		+ "{% for person in people %}\n- {{ person.name }} ({{ person.age }})\n{% endfor %}"
	)
	var data = {
		"name": "John",
		"age": 25,
		"people": [{"name": "Alice", "age": 30}, {"name": "Bob", "age": 28}]
	}

	var rendered_template = TemplateEngine.render_template(template, data)
	assert_eq(
		rendered_template, "Hello, John! You are 25 years old.\n\n- Alice (30)\n\n- Bob (28)\n"
	)


func test_0002_render_template():
	var template = """Hello, {{ name }}! You are {{ age }} years old.
{% for person in people %}
- {{ person.name }} ({{ person.age }})
{% endfor %}"""
	var data = {
		"name": "John",
		"age": 25,
		"people": [{"name": "Alice", "age": 30}, {"name": "Bob", "age": 28}]
	}

	var rendered_template = TemplateEngine.render_template(template, data)
	assert_eq(
		rendered_template, "Hello, John! You are 25 years old.\n\n- Alice (30)\n\n- Bob (28)\n"
	)


func test_0003_render_template():
	var template = """Hello, {{ name }}! You are {{ age }} years old.
{% for person in people %}
- {{ person.name }} ({{ person.age }})
	{% for child in person.children %}
	- {{ child.name }} ({{ child.age }})
	{% endfor %}
{% endfor %}
"""
	var data = {
		"name": "John",
		"age": 25,
		"people":
		[
			{
				"name": "Alice",
				"age": 30,
				"children":
				[
					{"name": "Lea", "age": 2},
					{"name": "Theo", "age": 4},
				]
			},
			{"name": "Bob", "age": 28, "children": []}
		]
	}

	var rendered_template = TemplateEngine.render_template(template, data)
	assert_eq(
		rendered_template,
		(
			"Hello, John! You are 25 years old.\n\n- Alice (30)\n\t\n\t- Lea (2)"
			+ "\n\t\n\t- Theo (4)\n\t\n\n- Bob (28)\n\t\n\n"
		)
	)
