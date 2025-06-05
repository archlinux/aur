# Download Guardian

**Download Guardian** is a lightweight user‐level service for Arch Linux (and derivatives) that watches your `~/Downloads` folder and prompts to scan any new file or folder with ClamAV.

---

## Features

* Monitors `~/Downloads` for newly created or moved‐in items.
* Zenity dialog: “Scan this file/folder?” → Yes/No.
* Notifications via `notify-send`:

  * **“Scanning…”** when a scan starts
  * **“Clean”** or **“Infected!”** when it finishes
  * **“Error”** if ClamAV fails
* Recursive scanning of directories.
* Minimal resource usage: powered by `inotifywait`.
* Runs under your user account (no root required).

---

## Installation

### 1. Download a prebuilt package

1. Go to **Releases** on this GitHub repository.
2. Download the latest `download-guardian-<version>-x86_64.pkg.tar.zst`.
3. Install with pacman:

   ```
   sudo pacman -U download-guardian-<version>-x86_64.pkg.tar.zst
   ```

### 2. From AUR (future)

Once available in AUR, you can install via an AUR helper:

```
paru -S download-guardian
```

*(Note: not yet uploaded to AUR.)*

### 3. Build manually

1. Clone the repository:

   ```
   git clone https://github.com/yashlakhtariya/download-guardian.git
   cd download-guardian
   ```
2. Ensure you have `base-devel`, `inotify-tools`, `clamav`, `zenity`, and `libnotify` installed:

   ```
   sudo pacman -S --needed base-devel inotify-tools clamav zenity libnotify
   sudo freshclam
   ```
3. Build and install:

   ```
   makepkg -si
   ```

---

## Usage

1. **Enable & start** the user service (no sudo needed):

   ```
   systemctl --user daemon-reload
   systemctl --user enable download-guardian.service
   systemctl --user start download-guardian.service
   ```
2. To **check status**:

   ```
   systemctl --user status download-guardian.service
   ```
3. To **stop** or **disable**:

   ```
   systemctl --user stop download-guardian.service
   systemctl --user disable download-guardian.service
   ```

(Optional) To keep the service running when not logged in graphically:

```
sudo loginctl enable-linger $(whoami)
```

---

## How It Works

* When a file/folder is created, closed, or moved into `~/Downloads`, the script (`download-guardian-scan.sh`) triggers.
* A Zenity dialog asks if you want to scan the new item.
* If **No**, nothing happens.
* If **Yes**, a “Scanning…” notification appears, `clamscan --infected --recursive --remove=no` runs, then you get a final notification:

  * **Exit code 0** → Clean
  * **Exit code 1** → Infected (with malware name)
  * **Exit code >1** → Error
* All events and scan outputs append to `~/clamav_notifier.log`.

---

## File Overview

```
download-guardian/
├── PKGBUILD
├── download-guardian-scan.sh
└── download-guardian.service
```

* **PKGBUILD**: Package metadata for Arch.
* **download-guardian-scan.sh**: Watches `~/Downloads`, prompts with Zenity, runs ClamAV, sends notifications.
* **download-guardian.service**: systemd user unit to launch the script on login.

---

## Configuration

* **Directory to watch**: Change `WATCH_DIR="$HOME/Downloads"` at the top of `download-guardian-scan.sh` if needed.
* **ClamAV options**: Modify `CLAMSCAN_OPTS="--infected --recursive --remove=no"` for custom flags.
* **Log file**: Outputs to `~/clamav_notifier.log`, editable in the script.

---

## Uninstall

1. **Stop & disable** the service:

   ```
   systemctl --user stop download-guardian.service
   systemctl --user disable download-guardian.service
   ```
2. **Remove** the package:

   ```
   sudo pacman -R download-guardian
   ```
3. (Optional) Delete the log:

   ```
   rm -f ~/clamav_notifier.log
   ```

---

## License

This project is licensed under the **MIT License**. See `LICENSE` for details.

---

Built with ❤️ by **Yash Lakhtariya**
