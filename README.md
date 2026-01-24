# ctotp 🛡️

**ctotp** is a minimal, blazing-fast CLI wrapper for [Ente Auth](https://ente.io/auth/). It allows you to search and copy your 2FA codes directly from your terminal or launcher without ever touching a GUI.

---

## ✨ Features

- ⚡ **Blazing Fast:** Uses `oathtool` and `fzf` for near-instant code generation.
- 🔍 **Fuzzy Search:** Search through all your 2FA accounts instantly using a terminal-based UI.
- 📦 **Vault Caching:** Converts Ente's export into a standardized `vault.json` for rapid access.
- 🔄 **Auto-Sync:** Update your local vault from Ente's servers with the `--sync` flag.
- 🤫 **Silent Mode:** Copy codes to clipboard without triggering desktop notifications.
- 🐧 **Wayland Native:** Built with `wl-clipboard` support for modern Arch setups (Niri, Hyprland, etc.).

---

## 🚀 Installation

### From the AUR (Recommended)
If you have an AUR helper like `yay` or `paru`:
~~~bash
yay -S ctotp-git
~~~

### Manual Installation
1. Clone the repository and make the script executable:
   ~~~bash
   git clone https://github.com/GibreelAbdullah/ctotp.git
   cd ctotp
   chmod +x ctotp
   sudo cp ctotp /usr/bin/ctotp
   ~~~

2. Ensure you have the dependencies installed:
   ~~~bash
   sudo pacman -S ente-cli oath-toolkit fzf wl-clipboard libnotify
   ~~~

---

## 🛠️ Setup & Usage

### 1. Initial Import
Ensure you have logged in via the `ente-cli` and have an export ready.
~~~bash
# Login to Ente
ente account add

# Generate the export file
ente export

# Import into ctotp (provide the path to your ente_auth.txt when prompted)
ctotp import
~~~

### 2. Copying Codes

**Interactive Search:**
~~~bash
ctotp copy
~~~

**Direct Copy by Name:**
~~~bash
ctotp copy GitHub
~~~

**Silent Copy (No Notifications):**
~~~bash
ctotp copy GitHub --silent
~~~

**Sync and Copy:**
~~~bash
ctotp copy --sync
~~~

---

## 📋 Requirements
- `ente-cli`: For syncing with Ente servers.
- `oath-toolkit`: For TOTP generation.
- `fzf`: For the interactive selection menu.
- `wl-clipboard`: For clipboard support.
- `libnotify`: For desktop notifications.

## 📄 License
MIT
