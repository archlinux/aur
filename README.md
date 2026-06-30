# Mixbus 12 - AUR Package

Harrison Consoles Mixbus DAW (Version 12) - Professional Digital Audio Workstation

## Current Version
- **Package Version**: 12.0.1-1
- **Maintainer**: z3n <z3nlabs at proton dot me>

## Description
Mixbus is a full-featured Digital Audio Workstation (DAW) with "True Analog Mixing"™
that provides professional-grade mixing capabilities based on Harrison's renowned
console sound. It is built on the open-source Ardour engine with Harrison's
proprietary DSP for EQ, compression, and the summing/mixbus topology.

## Features
- Analog console workflow and sound
- Built on Ardour's robust open-source foundation
- Harrison's proprietary DSP for EQ and compression
- Extensive MIDI capabilities
- Professional mixing and mastering tools
- Support for LV2 plugins on Linux

## ⚠️ Important: Linux Version Limitations

The Linux version of Mixbus has historically shipped with feature parity gaps
compared to the Windows/Mac builds. The following advertised features may be
**missing or incomplete** in the Linux build:

- **SSL 9KJ Channel Strip** - Windows/Mac exclusive
- **Slate Sounds Starter Pack** - replaced with Goldbaby Audio Loops
- **Harrison Creator Pack** - partial/unclear implementation
- **Per-channel RTA displays** - implementation status unclear

Linux users receive the core DAW functionality but not all advertised premium
features. Consider these limitations when purchasing.

## Installation

### From AUR
```bash
# Using an AUR helper (e.g., yay)
yay -S mixbus12

# Manual installation
git clone https://aur.archlinux.org/mixbus12.git
cd mixbus12
makepkg -si
```

### Requirements
- **System**: x86_64 architecture
- **Audio Group**: User must be in the 'audio' group
  ```bash
  sudo usermod -a -G audio $USER
  # Log out and back in for changes to take effect
  ```
- **Dependencies**:
  - glibc
  - libcurl-gnutls
  - readline
  - ncurses
  - zlib
  - bzip2

### Recommended Optional Dependencies
- `avldrums.lv2`: AVLinux drumkits
- `gmsynth.lv2`: General MIDI LV2 Synth
- `setbfree-lv2`: Tonewheel organ
- `x42-plugins-lv2`: Comprehensive set of plugins from X42 Project

## Usage
Launch Mixbus from your application menu or via terminal:
```bash
mixbus12
```

## Troubleshooting

### Symbol Lookup Errors
If you encounter errors like `undefined symbol: rl_print_keybinding`, this
package already removes conflicting bundled libraries (readline, history, etc.)
so the system versions are used. If issues persist, ensure your system is fully
updated.

### Audio Issues
If Mixbus doesn't detect your audio interface:
- Ensure you're in the 'audio' group
- Check that your audio system (JACK/PipeWire/PulseAudio) is running
- Try a different audio backend from within Mixbus

### Getting Help
- **AUR Comments**: https://aur.archlinux.org/packages/mixbus12
- **Harrison Support**: https://harrisonaudio.com/support
- **Mixbus Forum**: https://discourse.ardour.org/c/mixbus

## File Locations
- **Installation**: `/opt/Mixbus-12.0.1/`
- **Executable**: `/usr/bin/mixbus12`
- **Desktop Entry**: `/usr/share/applications/mixbus12.desktop`
- **Icons**: `/usr/share/icons/hicolor/*/apps/mixbus12.png`

## License
This is commercial software. A license must be purchased from Harrison Consoles
to use Mixbus beyond the demo period. Visit
https://store.harrisonaudio.com/all-products/mixbus for pricing and licensing
information.

## Build from Source
```bash
git clone https://aur.archlinux.org/mixbus12.git
cd mixbus12
makepkg -si
```

## Disclaimer
Mixbus is a trademark of Harrison Consoles. This AUR package is not officially
supported by Harrison Consoles. For official support, please contact Harrison
directly.

---
*Maintained by z3n <z3nlabs at proton dot me>*
