# todoist-cli

AUR package for [todoist-cli](https://github.com/Doist/todoist-cli) - the official Todoist command-line.

Binary: `td` (`@doist/todoist-cli` on npm)

AUR: https://aur.archlinux.org/packages/todoist-cli

## Install

```bash
yay -S todoist-cli
# or
paru -S todoist-cli
```

Manually:

```bash
git clone https://aur.archlinux.org/todoist-cli.git
cd todoist-cli
makepkg -si
```

## Usage

```bash
td auth login
td today
td inbox
td add "Buy milk tomorrow #Shopping"
td --help
```

Docs: https://github.com/Doist/todoist-cli
