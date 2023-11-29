# ReferenceCollector

Finds and generates a code reference from gdscript files.

 To use this tool:

 - Place this script and Collector.gd in your Godot project folder.
 - Open the script in the script editor.
 - Modify the properties below to control the tool's behavior.
 - Go to File -> Run to run the script in the editor.

## Members

### collector
- **Type:** SceneTree
- **Description:**

### directories
- **Type:** Array
- **Description:** A list of directories to collect files from.

### is_recursive
- **Type:** bool
- **Description:** If true, explore each directory recursively

### patterns
- **Type:** Array
- **Description:** A list of patterns to filter files.

### save_path
- **Type:** String
- **Description:** Output path to save the class reference.

## Methods

### _run
- **Return Type:** null
- **Description:**
