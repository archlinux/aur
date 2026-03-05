# Swordfish
`Swordfish` is a pkill-like CLI tool that's feature-rich and written in C. It lets you find and kill processes with ease and saftey.

## Why use this instead of pkill?
Swordfish was created to make managing processes easier. It started as a project for me (seaslug) to learn C, which then snowballed into a full on process manager. Why use Swordfish instead of pkill or other tools? Below are some reasons!
- You prefer more control via grouped flags (e.g. `-ky`)
- You want more safety if you kill the wrong process
- You like lightweight, clean, CLI tools
- You want to not only kill processes but also view information about them quickly

## Features
- Grouped flags like `-Sky` (inspired by pacman)
- Raw signal support (e.g. `-10`, `-15`, `TERM`, `KILL`)
- Lightweight and dependency-free (for now)
- pre and post-kill script hooks (`--pre-hook <file>` / `--post-hook <file>`)
- Basic regex support
- Static mode for read-only listing
- Verbose process info
- Sorting modes (RAM, CPU, age)
- Pattern exclusions (`--exclude <pattern>`)
- Built-in retry functionality (`-r <time>`)
- Auto-completions for Bash, Fish, and Zsh
- And much more...

More can be found on the help pages
###

![swordfish preview](assets/img1.png)

![swordfish preview](assets/img2.png)

## Usage Examples

```bash
# Kill all 'nvim' processes using SIGTERM
swordfish -k nvim

# Kill all 'nvim' processes using SIGKILL
swordfish -K nvim

# Kill all 'nvim' and 'firefox' processes without the confirmation
swordfish -ky nvim firefox

# Kill processes selected via user input
swordfish -Sk bash

# Recursively terminate 'firefox' every 1 second
swordfish -kyr 1 firefox

# Run 'script1.sh' and 'script2.sh' before/after killing Neovim
swordfish -TERM --pre-hook script1.sh --post-hook script2.sh nvim
```

## Installation
From the AUR (AUR pkg manager):
```bash
yay -S swordfish-git
```

Or manually:
```bash
git clone https://aur.archlinux.org/swordfish-git.git
cd swordfish-git
makepkg -si
```

## Building From Source
Building from source is fairly easy. All you need is `gcc` and `make` (for now). Our makefile is fairly built out, meaning it can do quite a lot.

Default Build (dev ENV):
```bash
git clone https://github.com/Foox-dev/swordfish
cd swordfish
make
# Binary is outputed to the build directory in root
````

Release build (Recommended)
```bash
git clone https://github.com/Foox-dev/swordfish
cd swordfish
make rel
# Binary is outputed to build/release
```

By default, the build script will automaticly compile docs into `docs`. For now this is not an issue since the project is relativly small.

## License
MIT
