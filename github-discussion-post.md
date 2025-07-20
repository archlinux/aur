# 📦 New Arch Linux AUR Package Available!

Hi everyone! 👋

I'm excited to announce that **claude-monitor** is now available as an official Arch Linux AUR package!

## 🚀 Installation

For Arch Linux users, you can now install claude-monitor easily using your favorite AUR helper:

```bash
# Using yay
yay -S claude-monitor-git

# Using paru  
paru -S claude-monitor-git

# Or manually
git clone https://aur.archlinux.org/claude-monitor-git.git
cd claude-monitor-git
makepkg -si
```

## 📋 Package Details

- **Package name**: `claude-monitor-git`
- **AUR Link**: https://aur.archlinux.org/packages/claude-monitor-git
- **Builds from**: Latest git source (always up-to-date)
- **Dependencies**: Automatically handled (Python 3.8+, python-pytz, python-rich)

## 🔧 What's Included

The AUR package includes a patch that fixes a missing dependency issue in the upstream code, ensuring smooth installation and operation on Arch Linux systems.

## ✨ Why This Matters

- **No manual Python environment setup** - installs system-wide through pacman
- **Automatic dependency management** - all Python dependencies handled by the package manager  
- **Easy updates** - `yay -Syu` will keep it current with upstream
- **Clean uninstalls** - `pacman -R claude-monitor-git` removes everything cleanly

## 🙏 Feedback Welcome

If you encounter any issues with the AUR package specifically (not the tool itself), please let me know! The package is maintained independently but aims to provide the smoothest possible installation experience for Arch users.

Thanks to @Maciek-roboblog for creating this awesome tool! 🎉

---

*For issues with the AUR package itself, you can also comment on the [AUR page](https://aur.archlinux.org/packages/claude-monitor-git) or reach out directly.*