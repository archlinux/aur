# kicad-storybook

A tool to automatically generate images &amp; READMEs for KiCad symbols &amp; footprints

## Requirements

- [sexpdata](https://sexpdata.readthedocs.io/)
- [imagemagick](https://imagemagick.org/)
- [kicad-cli](https://www.kicad.org/blog/2023/02/Version-7.0.0-Released/)

## Usage

```sh
# Read symbols & footprints from ~/kicad dir, output images & README
./main.py ~/kicad/symbols/ ~/kicad/footprints/ ./images/ ./README.md
```
