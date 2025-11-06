# sololinux-gui

GUI configuration files for SoloLinux - a customized Arch Linux distribution featuring Hyprland window manager.

## Installation

```bash
yay -S sololinux-gui
```

## About

This package provides all the GUI configurations for SoloLinux including:

- **Hyprland** - Dynamic tiling Wayland compositor
- **Waybar** - Highly customizable status bar
- **Rofi** - Application launcher
- **Kitty** - GPU-accelerated terminal
- **Neovim & Emacs** - Pre-configured editors
- **Starship** - Shell prompt

Configuration files are installed to `/etc/skel/` for new users.

## Post-Installation

For existing users, copy configs from `/etc/skel/`:

```bash
cp -r /etc/skel/.config/* ~/.config/
cp /etc/skel/.tmux.conf ~/
cp /etc/skel/.zshrc ~/
```

## Links

- GitHub: https://github.com/Solomon-DbW/SoloLinux_GUI
- Issues: https://github.com/Solomon-DbW/SoloLinux_GUI/issues
