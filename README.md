# mistral-vibe-bin-hardened

**Mistral Vibe - Minimal CLI Coding Agent (Hardened Binary Distribution)**

[![AUR version](https://img.shields.io/aur/version/mistral-vibe-bin-hardened)](https://aur.archlinux.org/packages/mistral-vibe-bin-hardened)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue)](https://github.com/mistralai/mistral-vibe/blob/main/LICENSE)
[![Maintainer](https://img.shields.io/badge/maintainer-Markus%20Maiwald-green)](mailto:markus@maiwald.work)

---

## 🚀 Overview

This is a **hardened binary distribution** of [Mistral Vibe](https://github.com/mistralai/mistral-vibe), Mistral AI's minimal CLI coding agent. Unlike the official source-based AUR package, this package:

- ✅ **Uses pre-compiled binaries** from official GitHub releases (faster, cleaner)
- ✅ **Minimal dependencies** (only `glibc` required vs. 20+ Python packages)
- ✅ **Security-hardened** with AppArmor profile and strict permissions
- ✅ **Zero build-time complexity** - no Python dependency resolution needed
- ✅ **Faster updates** - binary packages update in seconds

## 📦 Installation

### From AUR (Recommended)

```bash
# Using yay
yay -S mistral-vibe-bin-hardened

# Using paru
paru -S mistral-vibe-bin-hardened

# Manual installation
git clone https://aur.archlinux.org/mistral-vibe-bin-hardened.git
cd mistral-vibe-bin-hardened
makepkg -si
```

### First-Time Setup

After installation, configure your Mistral AI API key:

```bash
vibe --setup
```

You'll be prompted to enter your Mistral AI API key. Get one from: https://console.mistral.ai/

## 🎯 Usage

### Basic Usage

```bash
# Start the Mistral Vibe coding agent
vibe

# Or use the explicit ACP mode command
vibe-acp
```

### Key Features

- **AI-Powered Coding Assistant**: Generate, refactor, and debug code with AI
- **Multiple Language Support**: Works with Python, JavaScript, Go, Rust, and more
- **Context-Aware**: Understands your project structure and coding patterns
- **Terminal-Based**: Minimal, distraction-free interface

## 🛡️ Security Features

This package includes comprehensive security hardening:

### 1. Binary Integrity

- **Official releases only**: Binaries sourced directly from Mistral AI GitHub releases
- **BLAKE2 checksums**: Verified against official release artifacts
- **No stripping**: Binary integrity preserved

### 2. Permission Hardening

- **Root-owned binaries**: Prevents tampering by non-privileged users
- **Strict file permissions**: 755 for executables, no world-writable files
- **Immutable installation**: Application directory protected from modification

### 3. AppArmor MAC (Optional)

Enable Mandatory Access Control for defense-in-depth:

```bash
# 1. Install AppArmor
sudo pacman -S apparmor

# 2. Enable AppArmor
sudo systemctl enable --now apparmor

# 3. Profile is auto-configured on package install
# Verify:
sudo aa-status | grep vibe
```

### 4. Minimal Attack Surface

- **Single dependency**: Only `glibc` required (vs. 20+ Python packages)
- **No build tooling**: Pre-compiled binary eliminates build-time attack vectors
- **Optional components**: Git and Python support are opt-in

For complete security documentation, see: [SECURITY.md](SECURITY.md)

## 📊 Comparison: Source vs. Binary Package

| Aspect | mistral-vibe (source) | mistral-vibe-bin-hardened (this package) |
|--------|------------------------|------------------------------------------|
| **Build Time** | ~2-5 minutes | ~10 seconds |
| **Dependencies** | 20+ Python packages | 1 (glibc) |
| **Install Size** | ~150 MB | ~40 MB (compressed) |
| **Security** | Standard | Hardened (AppArmor + strict perms) |
| **Update Speed** | Slow (rebuild) | Fast (binary swap) |
| **Complexity** | High (source build) | Low (binary extraction) |

## 🔧 Maintenance

### Check for Updates

```bash
./check-version.sh
```

### Automated Update

```bash
./auto-update-vibe.sh
```

For maintainers, see [UPDATE-AUTOMATION.md](UPDATE-AUTOMATION.md) for detailed update procedures.

## 📝 Package Contents

```
/opt/mistral-vibe/vibe-acp          # Main binary
/usr/bin/vibe                        # Launcher (symlink)
/usr/bin/vibe-acp                    # Launcher (symlink)
/usr/share/apparmor/vibe.apparmor    # AppArmor profile
/usr/share/applications/mistral-vibe.desktop  # Desktop entry
/usr/share/doc/mistral-vibe-bin-hardened/SECURITY.md  # Security docs
```

## 🐛 Troubleshooting

### API Key Issues

If the agent fails to authenticate:

```bash
# Reconfigure API key
vibe --setup

# Verify config file
cat ~/.config/mistral-vibe/config.toml
```

### Permission Denied (with AppArmor)

If you encounter permission issues with AppArmor enforced:

```bash
# Check AppArmor logs
sudo dmesg | grep DENIED | grep vibe

# Temporarily switch to complain mode for debugging
sudo aa-complain /etc/apparmor.d/vibe

# Re-enforce after fixing
sudo aa-enforce /etc/apparmor.d/vibe
```

### Binary Not Working

Verify binary integrity:

```bash
# Check permissions
ls -l /opt/mistral-vibe/vibe-acp
# Should be: -rwxr-xr-x 1 root root

# Test binary directly
/opt/mistral-vibe/vibe-acp --help
```

## 🤝 Contributing

Contributions welcome! If you encounter issues or have improvements:

1. **Security issues**: Email maintainer directly (do NOT open public issues)
2. **Bugs/Features**: Open an issue on the AUR package page
3. **Package improvements**: Submit patches via AUR

## 📚 Resources

- **Mistral Vibe GitHub**: https://github.com/mistralai/mistral-vibe
- **Mistral AI Docs**: https://docs.mistral.ai/
- **AUR Package**: https://aur.archlinux.org/packages/mistral-vibe-bin-hardened
- **Security Documentation**: [SECURITY.md](SECURITY.md)
- **Update Automation**: [UPDATE-AUTOMATION.md](UPDATE-AUTOMATION.md)

## ⚖️ License

- **Mistral Vibe**: Apache License 2.0 (see https://github.com/mistralai/mistral-vibe/blob/main/LICENSE)
- **Packaging**: Apache License 2.0

## 👤 Maintainer

**Markus Maiwald**
- Email: markus@maiwald.work
- AUR: [Markus Maiwald](https://aur.archlinux.org/account/markusmaiwald)

---

**Note**: This is an independent hardened packaging effort. It is **not an official Mistral AI release**. For official support, contact Mistral AI directly.

---

*Built with the Voxis Forge philosophy: Security, Reliability, Automation*
