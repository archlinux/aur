# forager

A Steam-like game launcher for your local game library.

## Installation

### With an AUR helper (recommended)

    paru -S forager
    yay -S forager

### Manually

    git clone https://aur.archlinux.org/forager.git
    cd forager
    makepkg -si

The package installs the `forager` launcher to `/usr/bin`, a `.desktop`
entry to `/usr/share/applications`, and the license to
`/usr/share/licenses/forager`.

## Usage

Run `forager` from a terminal or launch it from your application menu.

## Data paths

- Config: `~/.config/forager/` (override: `FORAGER_CONFIG_DIR`)
- Cache and artwork: `~/.cache/forager/` (override: `FORAGER_CACHE_DIR`)
- Default game library: `~/Games`
- Steam appcache art source: `~/.local/share/Steam/appcache/librarycache`
