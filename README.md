# DARCH

# Table of Contents

- [DARCH](#darch)
- [Table of Contents](#table-of-contents)
- [Introduction](#introduction)
- [Installation](#installation)

# Introduction

This repository is meant to easily setup a new computer with my personal settings. It is meant to first cleanly install the [OS](https://archcraft.io/) and then directly run the script. **Sadly snapd has to be installed and the system restarted before the script can be run.**. It is meant to just cleanly install Arch Linux and then run the script. The script then installs the needed packages. **After installation, input your cridentials in /etc/mopidy/mopidy.conf according to https://blog.deepjyoti30.dev/using-spotify-with-ncmpcpp-mopidy-linux**

# Installation

<!-- AS AUR PACKAGE OR JUST PACKAGE STANDALONE https://wiki.archlinux.org/title/Creating_packages -->

```bash
yay
yay -S snapd
sudo systemctl enable snapd
sudo systemctl start snapd
*restart*
git clone https://github.com/quiode/DARCH
cd DARCH
makepkg -si
DARCH
```
