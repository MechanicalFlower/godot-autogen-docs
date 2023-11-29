# Collector

Finds and generates a code reference from gdscript files.

## Members

### warnings_regex
- **Type:** RegEx
- **Description:**

## Methods

### _init
- **Return Type:** Collector
- **Description:**

### find_files
- **Return Type:** PackedStringArray
- **Description:** Returns a list of file paths found in the directory.

 **Arguments**

 - dirpath: path to the directory from which to search files.
 - patterns: an array of string match patterns, where "*" matches zero or more
   arbitrary characters and "?" matches any single character except a period
   ("."). You can use it to find files by extensions. To find only GDScript
   files, ["*.gd"]
 - is_recursive: if `true`, walks over subdirectories recursively, returning all
   files in the tree.

### save_text
- **Return Type:** null
- **Description:** Saves text to a file.

### get_reference
- **Return Type:** Dictionary
- **Description:** Parses a list of GDScript files and returns a list of dictionaries with the
 code reference data.

 If `refresh_cache` is true, will refresh Godot's cache and get fresh symbols.

### remove_warning_comments
- **Return Type:** null
- **Description:** Directly removes 'warning-ignore', 'warning-ignore-all', and 'warning-disable'
 comments from all symbols in the `symbols` dictionary passed to the function.

### remove_warnings_from_description
- **Return Type:** String
- **Description:**

### print_pretty_json
- **Return Type:** String
- **Description:**
