# treecat

treecat is a tiny Bash utility that combines `tree` + `cat`: it prints files or entire directory trees (when invoked with `-r`) recursively, wrapping each file’s contents in Markdown code blocks.

## Features

- **Non-recursive by default** (only top-level files): use `-r/--recursive` to descend.
- **Exclude patterns** with `-e/--exclude` (glob syntax).
- **Include patterns** with `-I/--include` (glob syntax).
- **Always outputs** basic Markdown code blocks with `File Name: <path>:` header.

## Installation

### From AUR

```bash
# with an AUR helper
yay -S treecat
```

# or manually

```bash
git clone https://aur.archlinux.org/treecat.git
cd treecat
makepkg -si
```

### From GitHub

```bash
git clone https://github.com/amitpalsbadhan/treecat.git
cd treecat
sudo install -Dm755 treecat.sh /usr/local/bin/treecat
```

## Usage

```bash
# cat a single file
treecat README.md

# non-recursive tree + cat of a directory
treecat src/

# recursive
treecat -r src/

# recursive, skipping markdown & binary images
treecat -r -e '*.md' -e '*.png' src/

# only include shell & C++ files
treecat -r -I '*.sh' -I '*.cpp' .
```

## Options

- `-r, --recursive` Recurse into directories
- `-e, --exclude PATTERN...` Exclude files matching these globs
- `-I, --include PATTERN...` Only include files matching these globs
- `-h, --help` Show help
- `--version` Show version

## License

MIT © Amitpal Badhan
