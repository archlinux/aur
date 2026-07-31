# forager

A Steam-like game launcher for your local game library.

## Installation

### With an AUR helper (recommended)

    paru -S forager
    yay -S forager

### Manual AUR install

    git clone https://aur.archlinux.org/forager.git
    cd forager
    makepkg -si

### Manual install from source (no AUR)

    git clone https://github.com/foxinwinter/forager.git
    cd forager
    python -m venv .venv
    .venv/bin/pip install .
    .venv/bin/forager

The package installs the `forager` launcher to `/usr/bin`, a `.desktop`
entry to `/usr/share/applications`, and the license to
`/usr/share/licenses/forager`.

## Platform

- **Architecture: `x86_64` only.** The launcher is pure Python, but the
  runtime stack it depends on (Steam, Proton, DepotDownloader, and the
  Windows `.exe` games themselves) is x86_64-only today.
- **aarch64 could be added in the future** if there is demand: DepotDownloader
  already ships an official `linux-arm64` build, and Valve now publishes an
  experimental ARM64 Proton (via FEX translation). Steam's Linux client is
  still x86_64-only, which blocks Steam-game launching on ARM for now.

## Usage

Run `forager` from a terminal or launch it from your application menu.

## Data paths

- Config: `~/.config/forager/` (override: `FORAGER_CONFIG_DIR`)
- Cache and artwork: `~/.cache/forager/` (override: `FORAGER_CACHE_DIR`)
- Default game library: `~/Games`
- Steam appcache art source: `~/.local/share/Steam/appcache/librarycache`
