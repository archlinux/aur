# DaVinci Resolve Community

**Unofficial Arch Linux PKGBUILD for DaVinci Resolve 20.0.1**

This is a community-maintained `PKGBUILD` for the latest version of [DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve) (Free edition). It simplifies the process of installing Resolve on Arch-based systems, including auto-downloading the official installer and patching library compatibility.

> ⚠️ This repository does **not** host the proprietary DaVinci Resolve installer. You must download it manually or via script (see below).

---

## 📦 Features

- Fully updated for **DaVinci Resolve 20.0.1**
- Works with **modern AMD and NVIDIA GPUs**
- Automatically fixes known symbol/library conflicts (`libglib`, `libgio`, etc.)
- Preserves compatibility with the original AUR package layout

---

## 🚀 Installation

1. **Clone this repo**:
   ```bash
   git clone https://github.com/dkcheun/davinci-resolve-community.git
   ```
   cd davinci-resolve-community
2. **Download the Installer** from the website and place the Zip folder next to the `PKGBUILD`.
3. **Build & Install**
    ```bash
    makepkg -si
    ```
## 🧠 Requirements
- Arch Linux compatible 
- `yay` or equivalent AUR helper
- GPU drivers:
    - AMD: mesa + `opencl-amd`
    - NVIDIA: `nvidia`, `opencl-nvidia`

## LICENSE
This repository is provided under the terms of the MIT License.
DaVinci Resolve is proprietary software and is © Blackmagic Design Pty Ltd. This repository does not distribute the binary installer.

> **Tip**: Want Studio edition support or automation for multiple Resolve versions? Open a PR or fork and extend this repo.
