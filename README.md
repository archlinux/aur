# Syscall

[![AUR](https://img.shields.io/aur/version/syscall?logo=arch-linux&label=AUR)](https://aur.archlinux.org/packages/syscall)
[![License](https://img.shields.io/badge/license-GPLv3-brightgreen)]()
[![Language](https://img.shields.io/badge/language-Python%20%2B%20C-blue)]()

A minimal **sudo-like privilege elevation tool for Linux**, written in **Python + C**  
with **PAM authentication** and **system-wide secure password caching**.

Syscall acts as a clean, lightweight alternative to sudo/doas while keeping strict  
security boundaries. Authentication is performed via PAM, and a secure C setuid helper  
executes privileged commands safely.

---

## ✨ Features

- 🔐 **PAM-based password authentication**  
- 🕒 **System-wide privilege cache** (shared across all terminals)  
- ⚙️ **Execute commands as root:**  
```bash
syscall <command>
```
or
```bash
sycall <command>
```
- ⏱ **Temporary root access** via privilege cache:
- Enable root access for a limited time:
```bash
syscall --enable <minutes>
```
- Disable the temporary root access manually:
```bash
syscall --disable
```
- Check the current status of the root access cache:
```bash
syscall --status
```

## 🚀 Usage

Run any command as root via syscall:

Update system packages
```bash
syscall pacman -Syu
```
Restart a system service
```bash
syscall systemctl restart NetworkManager
```

Edit a root-owned file
```bash
syscall vim /etc/hosts
```

---

### **Installation from AUR**

## 📦 Installation

### From the AUR

Install directly using an AUR helper;

```bash
yay -S syscall
```
```bash
paru -S syscall
```
```bash
ame ins syscall
```

### **Manual Installation**

### Manual Install

Clone the repository and build the package manually:

```bash
git clone https://github.com/0xraincandy/syscall.git
cd syscall
makepkg -si
```

🔒 Authentication Cache

Syscall stores authentication securely using a root-owned state file accessed
through the setuid helper. Once authenticated, you won’t be prompted again until
the cache expires.
