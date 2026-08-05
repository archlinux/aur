# VarAC EmComm AUR Package (`varac-bin`)

[![Arch Linux AUR](https://img.shields.io/badge/AUR-varac--bin-blue.svg)](https://aur.archlinux.org/packages/varac-bin)
[![GitHub Repository](https://img.shields.io/badge/GitHub-9M2PJU%2FVarAC--EmComm--AUR-black.svg)](https://github.com/9M2PJU/VarAC-EmComm-AUR)
[![License](https://img.shields.io/badge/license-custom-lightgrey.svg)](#disclaimer--license)

Arch Linux PKGBUILD package for **VarAC** — the premier HF digital chat messenger designed for amateur radio operators and Emergency Communications (EmComm), running seamlessly on Arch Linux via Wine.

---

## 📌 Disclaimer & License

- **VarAC** is closed-source / proprietary software created and maintained by **Irad Deutsch (4Z1AC)**.
- Official website: [https://www.varac-hamradio.com](https://www.varac-hamradio.com)
- **Distribution Note**: To respect the author's distribution policies, this package **does not redistribute** any VarAC binaries. Instead, `makepkg` downloads the official ZIP archive directly from the author's download server during the package build process.

---

## ✨ Features

- **Automated Desktop Integration**: Extracts the official application icon (`VarAC.exe`) using `icoutils` and installs desktop menu entries (`varac.desktop`) for KDE, GNOME, XFCE, and modern desktop environments.
- **Smart User Directory Syncing**: Includes a wrapper launcher script (`varac`) that creates and updates `~/.local/share/varac/`. User settings, templates, and CAT commands are preserved across package upgrades.
- **Wine & Mono Dependencies**: Configured with `wine` and `wine-mono` for smooth initialization out of the box.

---

## 🚀 Installation

### Option 1: Using an AUR Helper (Recommended)

```bash
yay -S varac-bin
```

or with `paru`:

```bash
paru -S varac-bin
```

---

### Option 2: Manual Build with `makepkg`

#### From AUR:
```bash
git clone https://aur.archlinux.org/varac-bin.git
cd varac-bin
makepkg -si
```

#### From GitHub:
```bash
git clone https://github.com/9M2PJU/VarAC-EmComm-AUR.git
cd VarAC-EmComm-AUR
makepkg -si
```

---

## 🛠️ Usage

### Launching VarAC

- **Application Menu**: Search for `VarAC` in your desktop environment's app launcher.
- **Terminal**: Run:
  ```bash
  varac
  ```

### File Locations

- **System Installation**: `/usr/share/varac/`
- **User Working Directory**: `~/.local/share/varac/` (contains `.ini` configuration files, logs, and templates)

### VARA Modem Requirement

VarAC relies on a **VARA HF Modem** backend to transmit digital signals over amateur radio frequencies.
- You can run VARA HF locally under Wine (e.g. via `vara-hf` package) or point VarAC to a remote network modem instance.

---

## 🤝 Maintainer

Maintained by **9M2PJU** ([9m2pju@hamradio.my](mailto:9m2pju@hamradio.my))  
Website: [https://hamradio.my](https://hamradio.my)

Issues, contributions, and PKGBUILD updates are welcome on the GitHub repository:  
👉 [https://github.com/9M2PJU/VarAC-EmComm-AUR](https://github.com/9M2PJU/VarAC-EmComm-AUR)
