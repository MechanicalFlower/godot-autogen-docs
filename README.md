
<div align="center">

# Godot Autogen Docs

![Godot Badge](https://img.shields.io/badge/godot-4.0|4.1-blue?logo=Godot-Engine&logoColor=white)
![license](https://img.shields.io/badge/license-MIT-green?logo=open-source-initiative&logoColor=white)
![reuse](./.reuse/REUSE-compliant.svg)

Godot addon that automatically turns your code
 comments into markdown, for use in documentation.

</div>

## About

### Usage

To generate a `reference.json`, run:
```
godot --editor --headless --quit --script addons/godot-autogen-docs/reference_collector_cli.gd
```

And to turn this JSON file into markdown, run:
```
godot --headless --quit --script addons/godot-autogen-docs/markdown.gd
```

## Contributing

![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)

We welcome community contributions to this project.

Please read our [Contributor Guide](CONTRIBUTING.md) for more information on how to get started.
