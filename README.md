# mixbus11 - Harrison Mixbus DAW (Version 11)

This is an AUR package for Harrison Mixbus, a professional digital audio workstation based on Ardour with Harrison's renowned analog-modeled mixing console.

## Package Information

- **Package Name**: mixbus11
- **Version**: 11.0.289
- **Architecture**: x86_64 only
- **License**: EULA (End User License Agreement)
- **Maintainer**: z3n <z3nlabs at proton dot me>

## Installation

### From AUR
```bash
yay -S mixbus11
# or
paru -S mixbus11
# or manually with makepkg
```

### Post-Installation Setup
After installation, you need to add your user to the `audio` group:
```bash
sudo usermod -a -G audio $USER
```
Log out and back in for the group changes to take effect.

## Library Compatibility Improvements

### Recent Arch Updates Issue
Recent Arch Linux updates have caused compatibility issues with bundled libraries in Mixbus, particularly with readline and ncurses libraries. Users were experiencing errors like:
```
/bin/sh: symbol lookup error: /bin/sh: undefined symbol: rl_print_keybinding
```

### Solution Implemented
This PKGBUILD has been enhanced to automatically handle these conflicts by:

1. **Removing Conflicting Bundled Libraries**: The package automatically removes these potentially problematic bundled libraries:
   - `libreadline.so*`
   - `libhistory.so*`
   - `libncurses.so*`
   - `libncursesw.so*`
   - `libtinfo.so*`
   - `libz.so*`
   - `libbz2.so*`

2. **Adding System Dependencies**: The package now explicitly depends on system versions of these libraries:
   - `readline`
   - `ncurses`
   - `zlib`
   - `bzip2`

3. **Enhanced Wrapper Script**: The launch wrapper ensures proper library loading order, allowing system libraries to take precedence over any remaining bundled libraries.

## Usage

Launch Mixbus in any of these ways:
- From the applications menu (Audio/Video category)
- Command line: `mixbus11`
- Alternative command: `Mixbus11`

## Troubleshooting

### Library Conflicts
If you experience library-related issues:

1. **Check for conflicting libraries**:
   ```bash
   ls -la /opt/Mixbus-11.0.289/lib/lib{readline,history,ncurses,z,bz2}*
   ```
   These should NOT exist (they're removed by the package).

2. **Verify system libraries are available**:
   ```bash
   pacman -Q readline ncurses zlib bzip2
   ```

3. **Manual library removal** (if needed):
   ```bash
   sudo rm -f /opt/Mixbus-11.0.289/lib/libreadline.so*
   sudo rm -f /opt/Mixbus-11.0.289/lib/libhistory.so*
   ```

4. **Automated troubleshooting script** (available in AUR repository):
   A `fix-library-conflicts.sh` script is available in the AUR package repository
   for automated conflict resolution if needed.

### Audio Group Issues
If Mixbus can't access audio devices:
```bash
# Check if you're in the audio group
groups $USER

# Add yourself to audio group if missing
sudo usermod -a -G audio $USER
```

### Permission Issues
If you encounter permission errors:
```bash
sudo chown -R root:root /opt/Mixbus-11.0.289
sudo chmod -R 755 /opt/Mixbus-11.0.289
```

### File Limit Warning
If you see "Your system is configured to limit Mixbus to 1048576 open files":
```bash
# Check current limits
ulimit -n

# Increase soft limit temporarily
ulimit -n 4096

# For permanent increase, edit /etc/security/limits.conf
echo "* soft nofile 4096" | sudo tee -a /etc/security/limits.conf
echo "* hard nofile 8192" | sudo tee -a /etc/security/limits.conf
```

## Dependencies

### Required
- `glibc` - Core C library
- `libcurl-gnutls` - HTTP library
- `readline` - Command line editing library
- `ncurses` - Terminal UI library
- `zlib` - Compression library
- `bzip2` - Compression library

### Optional
- `avldrums.lv2` - AVLinux drumkits
- `gmsynth.lv2` - General MIDI LV2 Synth
- `setbfree-lv2` - Tonewheel organ
- `x42-plugins-lv2` - Set of plugins and utilities from the X42 Project

## Technical Details

### Installation Path
Mixbus is installed to `/opt/Mixbus-11.0.289/`

### Wrapper Script
The package installs a wrapper script at `/usr/bin/mixbus11-wrapper` that:
- Sets proper library paths
- Configures environment variables
- Handles library conflicts
- Forces X11 backend for stability

### Library Path Strategy
The enhanced library loading strategy:
1. System libraries take precedence (prevents conflicts)
2. Mixbus-specific libraries are loaded from `/opt/Mixbus-11.0.289/lib/`
3. Standard system library paths are preserved

## Changelog

### Recent Improvements
- **Library Conflict Resolution**: Automatic removal of conflicting bundled libraries
- **Enhanced Dependencies**: Added explicit system library dependencies
- **Improved Wrapper**: Better library path handling and environment setup
- **Compatibility**: Fixed issues with recent Arch Linux updates
- **Documentation**: Comprehensive troubleshooting guide

## Support

For issues specific to this AUR package:
- Open an issue on the AUR package page
- Contact the maintainer: z3n <z3nlabs at proton dot me>

For Mixbus software issues:
- Visit Harrison Consoles support: https://support.harrisonaudio.com/
- Check the official Mixbus documentation

## License

This package is provided under the terms of Harrison Consoles' End User License Agreement (EULA). By installing this package, you agree to the terms of the Mixbus EULA.

The packaging files (PKGBUILD, install script, etc.) are provided as-is for use by the Arch Linux community.