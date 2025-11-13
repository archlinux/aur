# Unofficial rootapp AUR Package
This package doesn't include binaries of Root App itself. It only provides PKGBUILD to download and install the official AppImage from Root Communications, Inc.
## Installation
```bash
git clone https://aur.archlinux.org/rootapp.git
cd rootapp
makepkg -si
```

This will download the latest official Root App from Root's server and install it on your system
## Usage

After installation, you can run the app using:
```bash
rootapp
```
## License
Root App is proprietary software. By using it, you agree to Root Communications, Inc. [Terms of Use](https://www.rootapp.com/terms-of-use).

The PKGBUILD itself is licensed under the Proprietary license in sense, that it doesn't modify or redistribute Root's software.
