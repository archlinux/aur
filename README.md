# raind

Terminal weather screensaver written in Go. Four modes: rain, thunder, snow, and meteor shower. Single static binary, no CGO, runs anywhere.

## Preview

| Rain | Thunderstorm |
|------|-------------|
| ![rain](assets/rain.gif) | ![thunderstorm](assets/thunderstorm.gif) |

| Snow | Meteor |
|------|--------|
| ![snow](assets/snow.gif) | ![meteor](assets/meteor.gif) |

## Install

Linux/macOS **amd64** (`x86_64`) or **arm64** (`aarch64`), release **v0.3.0**:

```bash
curl -fsSL https://raw.githubusercontent.com/rokuroo171/raind/main/install.sh | sh
```

Or clone and run the installer locally:

```bash
git clone https://github.com/rokuroo171/raind.git
cd raind
./install.sh
```

Options:

```bash
./install.sh --from-source
INSTALL_DIR=$HOME/.local/bin ./install.sh
VERSION=0.2.0 ./install.sh
```

Manual download: [GitHub Releases](https://github.com/rokuroo171/raind/releases) (`raind_0.3.0_linux_amd64.tar.gz`, `raind_0.3.0_linux_arm64.tar.gz`, `raind_0.3.0_darwin_amd64.tar.gz`, `raind_0.3.0_darwin_arm64.tar.gz`).

## Build from source

Requires Go 1.21+.

```bash
git clone https://github.com/rokuroo171/raind.git
cd raind
CGO_ENABLED=0 go build -o raind
./raind
```

## Cross-compile

arm64:
```bash
CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o raind-arm64
```

Windows:
```bash
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o raind.exe
```

## Controls

| Key | Action |
|-----|--------|
| `R` | Rain mode |
| `C` | Calm scene (clouds, sun, moon over the coastline) |
| `T` | Thunder mode |
| `S` | Snow mode |
| `M` | Meteor shower mode |
| `A` | Auto-cycle modes |
| `Z` | Focus mode |
| `+` / `=` | Increase speed |
| `-` | Decrease speed |
| `Q` / `Esc` / `Ctrl+C` | Quit |

## CLI

| Flag | Default | Values |
|------|---------|--------|
| `--mode`, `-m` | `rain` | `rain`, `thunder`, `snow`, `meteor`, `auto` |
| `--color`, `-c` | `cyan` | `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white` |
| `--speed`, `-s` | `medium` | `slow`, `medium`, `fast` |
| `--live`, `-l` | off | Live weather from Open-Meteo for your location |
| `--city` | | Live weather for a named city (implies `--live`) |
| `--world` | `coast` | Terrain: `coast` (default) or `city` |
| `--help`, `-h` | | Show usage |
| `--version`, `-v` | | Print version and exit |

Mode aliases (also accepted by `--mode`):

| Mode | Aliases |
|------|---------|
| Thunder | `thunderstorm` |
| Meteor | `meteors`, `shooting`, `shower` |

Examples:

```bash
raind --mode snow --color white --speed slow
raind --mode thunder --speed fast
raind --mode meteor --color yellow --speed fast
raind -m shower -c white -s medium
raind --live --world coast
```

## AUR (Arch Linux)

Available on the AUR for Arch-based distributions:

```bash
# Build from source (requires go)
yay -S raind
paru -S raind

# Prebuilt binary (no build dependencies)
yay -S raind-bin
paru -S raind-bin
```

## Packaging

GoReleaser builds `linux-amd64`, `linux-arm64`, `darwin-amd64`, and `darwin-arm64`.

## License

[MIT](LICENSE)
