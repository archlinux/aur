# Internet Usage Monitor for Linux 🌐

Real-time internet usage monitoring with Conky widget and notifications for Arch-based Linux distributions.

**Tested on Garuda Linux (Arch-based), KDE Plasma 6.3** ✅

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Linux-green.svg)
![Shell](https://img.shields.io/badge/shell-Bash-orange.svg)

## ✨ Features

- 📊 Real-time daily usage tracking with customizable limits
- 🖥️ Desktop widget showing current usage, limit, and progress
- 🔔 Notifications at 80% (warning) and 100% (critical) usage
- 🕛 Automatic daily reset at midnight
- 🌐 Auto-detection of active network interface

## 🚀 Installation

There are two primary ways to install Internet Usage Monitor:

### 1. For Arch Linux and Arch-based Distributions (Recommended)

Install the `internet-usage-monitor-git` package from the Arch User Repository (AUR). This will build from the latest development code. You can use an AUR helper like `yay` or `paru`:

```bash
# Using yay
yay -S internet-usage-monitor-git

# Using paru
paru -S internet-usage-monitor-git
```

Alternatively, you can clone the AUR build files and build manually with `makepkg`:

```bash
git clone https://aur.archlinux.org/internet-usage-monitor-git.git
cd internet-usage-monitor-git
makepkg -si
```

**Benefits of AUR installation:**

- Proper integration with your system's package manager (`pacman`).
- Scripts are installed to system paths (e.g., `/usr/bin/`).
- Configuration follows XDG standards (see Configuration section below).
- Easier updates and uninstallation.

**After installing this package, you must run the setup script to finish configuration:**

- Open a terminal and run:

    internet-usage-monitor-setup

  or, if that does not work:

    bash /usr/share/internet-usage-monitor-git/desktop_scripts/install.sh

This step is required to complete the installation and start the widget.

### 2. Manual Installation (Other Linux Distributions / Advanced Users)

If you are not on an Arch-based system, or prefer a manual installation into your home directory:

```bash
git clone https://github.com/YahyaZekry/internet-usage-monitor.git
cd internet-usage-monitor
chmod +x install.sh
./install.sh
```

This script will:

- Attempt to install required packages (e.g., `conky`, `bc`, `procps-ng`, `libnotify`, `zenity`).
- Copy scripts and configuration files directly into your home directory (e.g., `~/internet_monitor.sh`, `~/config.sh`).
- Optionally set up monitoring (cron job or systemd user service).

## ⚙️ Configuration

**If you installed via the AUR package:**

The main configuration file is `config.sh`. To customize it, first copy the default configuration to your user's XDG config directory:

```bash
mkdir -p ~/.config/internet-usage-monitor-git
cp /usr/share/internet-usage-monitor-git/config.sh ~/.config/internet-usage-monitor-git/config.sh
```

Then, edit your personal copy at `~/.config/internet-usage-monitor-git/config.sh`. For example, to change the daily limit:

```bash
DAILY_LIMIT_GB=2  # Set your daily limit in GB
```

## 📋 Usage

If installed via AUR, the scripts are in your system PATH. If installed manually, they are in `~/`.

```bash
# Check current usage (AUR: internet_monitor.sh, Manual: ~/internet_monitor.sh)
internet_monitor.sh usage

# Show status
internet_monitor.sh status

# Reset daily counter
internet_monitor.sh reset

# Test notifications
internet_monitor.sh test-warning
```

(For manual installations, prepend `~/` to the commands above if `~/` is not in your PATH.)

## 🎨 Widget Control

If installed via AUR, your user-specific Conky configuration is at `~/.config/internet-usage-monitor-git/conkyrc_internet`.
First, ensure you have copied and can customize it:

```bash
mkdir -p ~/.config/internet-usage-monitor-git
cp /usr/share/internet-usage-monitor-git/conkyrc_internet ~/.config/internet-usage-monitor-git/conkyrc_internet
```

Then, to restart Conky with this configuration:

```bash
# Restart widget with new config
killall conky
nohup conky -c ~/.config/internet-usage-monitor-git/conkyrc_internet > /dev/null 2>&1 & disown
```

(For manual installations, the path is `~/.conkyrc_internet`.)

## 🔄 Monitoring Options

1. **⏰ Cron Job (Recommended)** - Runs every 5 minutes, universal compatibility
2. **⏲️ Systemd User Service** - More precise timing, higher complexity

## 🗑️ Uninstall

```bash
./uninstall.sh
```

## 📁 File Structure

The file locations depend on the installation method:

### For AUR Package Installations (`internet-usage-monitor-git`)

- **Executable Scripts:**
  - `/usr/bin/internet_monitor.sh`
  - `/usr/bin/conky_usage_helper.sh`
  - `/usr/bin/internet_monitor_daemon.sh`
- **Default Configuration Files (templates):**
  - `/usr/share/internet-usage-monitor-git/config.sh`
  - `/usr/share/internet-usage-monitor-git/conkyrc_internet`
- **User-Specific Configuration (customized by user):**
  - `~/.config/internet-usage-monitor-git/config.sh`
  - `~/.config/internet-usage-monitor-git/conkyrc_internet`
- **User Data and Logs:**
  - `~/.local/share/internet-usage-monitor-git/usage_data` (Usage data)
  - `~/.local/share/internet-usage-monitor-git/usage_log` (Activity logs)
- **Daemon PID File (if daemon is used):**
  - `/run/user/UID/internet-usage-monitor-git/daemon.pid` (where UID is your user ID)

### For Manual `install.sh` Installations

This method installs files directly into your home directory:

```
~/.internet_usage_data     # Usage data
~/.internet_usage.log      # Activity logs
~/.conkyrc_internet        # Widget config (copied here by install.sh)
~/internet_monitor.sh      # Main script
~/conky_usage_helper.sh    # Helper script
~/config.sh               # Configuration (copied here by install.sh)
# Potentially:
# ~/.config/autostart/internet-conky.desktop (if autostart enabled via install.sh)
# Cron jobs or systemd user services (managed by install.sh or manually)
```

## 🤝 Contributing

1. **Fork** the repository
2. **Clone** your fork: `git clone https://github.com/yourusername/internet-usage-monitor.git`
3. **Create** feature branch: `git checkout -b feature/amazing-feature`
4. **Make** your changes and test thoroughly
5. **Commit** changes: `git commit -m 'Add amazing feature'`
6. **Push** to branch: `git push origin feature/amazing-feature`
7. **Open** Pull Request

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

**Copyright (c) 2025 Yahya Zekry**

## 📞 Support

- 🐛 **Bug reports**: GitHub issues
- 📚 **Documentation**: See `docs/` folder for advanced usage
- 💡 **Feature requests**: Submit via GitHub issues

---

> _"Keep your data usage as balanced as your yerba mate blend — never too much, always just right."_ 🧉⚖️
