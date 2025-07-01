# Pom - AUR Package

Advanced Pomodoro timer with CLI and Web UI for Arch Linux.

## Installation

```bash
# Using yay (recommended)
yay -S pom

# Using paru
paru -S pom

# Manual installation
git clone https://aur.archlinux.org/pom.git
cd pom
makepkg -si
```

## Features

- 🌐 **Web UI** with Galactic Flux theme
- 👥 **Multi-profiles** (work, study, quick, custom)
- 🧠 **AI suggestions** based on performance
- 📅 **Calendar heatmap** view
- 📤 **Export/Import** (JSON/CSV)
- 🔄 **Cloud sync** (GitHub/Dropbox)
- 🧩 **Plugin system** for automation
- 🔐 **Privacy mode** with zero logging

## Quick Start

```bash
# CLI usage
pom start                    # Basic session
pom profile use work         # Use work profile
pom insights suggest         # Get AI recommendations

# Web interface
pom web                      # Start on port 8080
# Open http://localhost:8080 in browser
```

## Dependencies

- **Runtime**: None (statically linked Go binary)
- **Optional**: 
  - `pulseaudio` or `pipewire-pulse` for sound notifications
  - `git` for cloud sync via GitHub
  - `rclone` for Dropbox sync

## Configuration

Config files stored in `~/.config/pom/`:
- `config.json` - Settings and current profile
- `profiles.json` - Custom profiles
- `plugins.json` - Plugin configurations
- `goals.json` - Daily goals
- `tasks.json` - Task list

## Support

- **Issues**: https://github.com/Flack74/pom/issues
- **Documentation**: https://github.com/Flack74/pom
- **AUR Package**: https://aur.archlinux.org/packages/pom

## License

MIT License