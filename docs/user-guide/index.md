## Command Line Interface

The Godot Autogen Docs tool provides a command-line interface for generating documentation from Godot Engine scripts. This guide outlines the available commands and options.

### Usage

```bash
$ godot --editor --headless --quit --script res://addons/godot-autogen-docs/cli.gd <command> [<option> ...]
```

#### Commands

- `markdown`
    - Export documentation to markdown.

- `readthedocs`
    - Export documentation to markdown compatible with the readthedocs theme.

### Options
- `-ddir`
    - Comma-delimited list of directories to collect files from.

- `-doutdir`
    - A directory for saving documentation files.

### Example Usage

Display the help Text
```bash
$ godot --editor --headless --quit --script res://addons/godot-autogen-docs/cli.gd help
```

Export Documentation to Markdown
```bash
$ godot --editor --headless --quit --script res://addons/godot-autogen-docs/cli.gd markdown -ddir "path/to/scripts" -doutdir "path/to/output"
```

Export Documentation for ReadTheDocs
```bash
$ godot --editor --headless --quit --script res://addons/godot-autogen-docs/cli.gd readthedocs -ddir "path/to/scripts" -doutdir "path/to/output"
```

### Notes
- The markdown command exports documentation in regular markdown format.
- The readthedocs command exports documentation in markdown compatible with the readthedocs theme.
