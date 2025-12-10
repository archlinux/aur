# mistral-vibe-hardened

**Mistral Vibe - Minimal CLI Coding Agent (Security Hardened)**

[![AUR version](https://img.shields.io/aur/version/mistral-vibe-hardened)](https://aur.archlinux.org/packages/mistral-vibe-hardened)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue)](https://github.com/mistralai/mistral-vibe/blob/main/LICENSE)
[![Maintainer](https://img.shields.io/badge/maintainer-Markus%20Maiwald-green)](mailto:markus@maiwald.work)

---

## 🚀 Overview

This is a **security-hardened** distribution of [Mistral Vibe](https://github.com/mistralai/mistral-vibe), Mistral AI's minimal CLI coding agent.

### What Makes This Package Different?

| Feature | mistral-vibe (existing) | **mistral-vibe-hardened** (this) |
|---------|-------------------------|----------------------------------|
| **AppArmor MAC** | ❌ None | ✅ Auto-configured profile |
| **Security Docs** | ❌ None | ✅ Comprehensive guide |
| **Post-Install** | Basic | Security-focused guidance |
| **Build Process** | hatch/pip mess | Clean `uv` build |
| **Terminal Guidance** | ❌ None | ✅ TUI compatibility warnings |

**Our Unique Value: Security hardening that the standard package doesn't provide.**

## 📦 Installation

### From AUR

```bash
# Using yay
yay -S mistral-vibe-hardened

# Using paru
paru -S mistral-vibe-hardened

# Manual
git clone https://aur.archlinux.org/mistral-vibe-hardened.git
cd mistral-vibe-hardened
makepkg -si
```

### First-Time Setup

```bash
vibe --setup
```

Get your API key from: https://console.mistral.ai/

## 🎯 Usage

```bash
# Start the coding agent
vibe

# Or explicitly
vibe-acp
```

### ⚠️ Terminal Requirements

Mistral Vibe uses a TUI (Terminal User Interface). **Run it in a proper terminal:**

✅ **Works well:**
- kitty
- alacritty
- gnome-terminal
- konsole
- xterm

⚠️ **May have issues:**
- VS Code integrated terminal
- IDE embedded terminals

If you see a blank screen, try: `kitty vibe`

## 🛡️ Security Features

### 1. AppArmor Mandatory Access Control

Auto-configured on install if AppArmor is present:

```bash
# Verify
sudo aa-status | grep vibe
```

### 2. What the Profile Restricts

- ✅ Network access (API only)
- ✅ User config/cache directories
- ✅ Git integration
- ❌ Denies `/etc/shadow`, `/boot`, `/root`
- ❌ Denies kernel parameter modification
- ❌ Denies capability escalation

### 3. Security Documentation

Full security guide installed at:
```
/usr/share/doc/mistral-vibe-hardened/SECURITY.md
```

## 🔧 Maintenance

### Check for Updates

```bash
./check-version.sh
```

### Update the Package

```bash
./auto-update-vibe.sh
```

## 🐛 Troubleshooting

### Blank Screen / TUI Not Rendering

Run in an external terminal:
```bash
kitty vibe
```

### API Key Issues

```bash
vibe --setup
cat ~/.config/mistral-vibe/config.toml
```

### AppArmor Issues

```bash
# Check logs
sudo dmesg | grep DENIED | grep vibe

# Temporarily disable for debugging
sudo aa-complain /etc/apparmor.d/vibe
```

## 📚 Resources

- **Mistral Vibe GitHub**: https://github.com/mistralai/mistral-vibe
- **Mistral AI Docs**: https://docs.mistral.ai/
- **Security Documentation**: [SECURITY.md](SECURITY.md)

## ⚖️ License

- **Mistral Vibe**: Apache License 2.0
- **Packaging**: Apache License 2.0

## 👤 Maintainer

**Markus Maiwald** - markus@maiwald.work

---

*Security-hardened packaging by Voxis Forge*
