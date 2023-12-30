
<div align="center">

# Godot Autogen Docs

![Godot Badge](https://img.shields.io/badge/godot-4.1%20%7C%204.2-blue?logo=Godot-Engine&logoColor=white)
![license](https://img.shields.io/badge/license-MIT-green?logo=open-source-initiative&logoColor=white)
![reuse](./.reuse/REUSE-compliant.svg)

Godot addon that automatically turns your code
 comments into markdown, for use in documentation.

</div>

## About

### Usage

```
$ just godot --editor --headless --quit --script addons/godot-autogen-docs/cli.gd help

Usage:
        godot --editor --headless --quit --script res://addons/godot-autogen-docs/cli.gd <command> [<options> ...]

Commands:
        help                    Display this text
        markdown                Export documentation to markdown
        readthedocs             Export documentation to markdown compatible with the readthedocs theme

Options:
        -ddir                   Comma delimited list of directories to collect files from
        -doutdir                A directory for saving documentation files
```

## Contributing

![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)

We welcome community contributions to this project.

Please read our [Contributor Guide](CONTRIBUTING.md) for more information on how to get started.
