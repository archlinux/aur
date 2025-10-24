# Mixbus 11 - AUR Package

Harrison Consoles Mixbus DAW (Version 11) - Professional Digital Audio Workstation

## Current Version
- **Package Version**: 11.1.71-1
- **Released**: October 2024
- **Maintainer**: z3n <z3nlabs at proton dot me>

## Description
Mixbus is a full-featured Digital Audio Workstation (DAW) with "True Analog Mixing"™ that provides professional-grade mixing capabilities based on Harrison's renowned console sound.

## Features
- Analog console workflow and sound
- Built on Ardour's robust open-source foundation
- Harrison's proprietary DSP for EQ and compression
- Extensive MIDI capabilities
- Professional mixing and mastering tools
- Support for VST, LV2, and AU plugins (Linux version supports LV2)

## Installation

### From AUR
```bash
# Using an AUR helper (e.g., yay)
yay -S mixbus11

# Manual installation
git clone https://aur.archlinux.org/mixbus11.git
cd mixbus11
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
mixbus11
```

## Recent Updates

### Version 11.1.71 (October 2024)
- Updated from 11.0.289 to 11.1.71
- Improved compatibility with recent Arch Linux updates
- Enhanced library conflict resolution
- Added proper SHA256 checksums for source verification
- Security improvements in package build process

### Key Improvements
- **Library Conflict Resolution**: Removed bundled libraries that conflict with system versions (readline, ncurses, etc.)
- **Enhanced Wrapper Script**: Proper environment setup for better compatibility
- **Wayland Support**: Added GDK_BACKEND=x11 for improved Wayland compatibility
- **Security**: All source files now use proper SHA256 verification

## Troubleshooting

### Common Issues

#### 1. Symbol Lookup Errors
If you encounter errors like `undefined symbol: rl_print_keybinding`:
- **Solution**: This package already removes conflicting bundled libraries. If issues persist, ensure your system is fully updated.

#### 2. Audio Issues
If Mixbus doesn't detect your audio interface:
- Ensure you're in the 'audio' group
- Check your audio system (JACK/PipeWire/PulseAudio) is running
- Try launching with different audio backends

#### 3. Plugin Issues
For LV2 plugin problems:
- Ensure plugins are installed in standard paths
- Check plugin compatibility with Mixbus 11

### Getting Help
- **AUR Comments**: https://aur.archlinux.org/packages/mixbus11
- **Harrison Support**: https://harrisonconsoles.com/support/
- **Mixbus Forum**: https://discourse.ardour.org/c/mixbus/

## File Locations
- **Installation**: `/opt/Mixbus-11.1.71/`
- **Executable**: `/usr/bin/mixbus11`
- **Desktop Entry**: `/usr/share/applications/mixbus11.desktop`
- **Icons**: `/usr/share/icons/hicolor/*/apps/mixbus11.png`

## License
This is commercial software. A license must be purchased from Harrison Consoles to use Mixbus beyond the demo period. Visit https://harrisonconsoles.com/products/mixbus/ for pricing and licensing information.

## Security Audit
This package has undergone comprehensive security testing:
- ✅ No SUID/SGID binaries
- ✅ No world-writable files
- ✅ Proper file permissions
- ✅ Source integrity verification via SHA256
- ✅ Clean library dependencies

See `test_report/SECURITY_AUDIT_11.1.71.md` for detailed security audit results.

## Build from Source
If you want to build the package yourself:

```bash
# Clone the repository
git clone https://aur.archlinux.org/mixbus11.git
cd mixbus11

# Download source
wget "https://eu1.download.solidstatelogic.com/Mixbus%2011/Mixbus%2011.1/Mixbus-11.1.71-x86_64.tar"

# Build package
makepkg -si
```

## Changelog

### 11.1.71-1 (2024-10-24)
- Version bump to 11.1.71
- Updated download URL to new version path
- Added SHA256 checksum verification for all sources
- Improved security with proper checksums

### 11.0.289-2 (Previous)
- Fixed library conflicts with system readline
- Removed problematic bundled libraries
- Added enhanced wrapper script
- Improved Wayland compatibility

## Contributing
Contributions are welcome! Please submit issues and pull requests on the AUR page or contact the maintainer.

## Disclaimer
Mixbus is a trademark of Harrison Consoles. This AUR package is not officially supported by Harrison Consoles. For official support, please contact Harrison directly.

---
*Maintained by z3n <z3nlabs at proton dot me>*
*Last updated: October 24, 2024*