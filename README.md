# [Nordlayer](https://nordlayer.com) VPN package for Linux (esp [ArchLinux](https://archlinux.org/)) 
[![AUR version](https://img.shields.io/aur/version/nordlayer)](https://aur.archlinux.org/packages/nordlayer) [![Nordlayer version](https://img.shields.io/badge/nordlayer-2.6.5-green)](https://nordlayer.com/download/linux/)

### Hotfix (Version 2.6.5) released by Nordlayer
The new version should not break `nordlayer.db` 

If you're still facing issues afterwards - repeat 2.6.4 version fix
```sh
rm /var/lib/nordlayer/nordlayer.db
systemctl restart nordlayer
nordlayer login
```

### Upgrade from 2.6.3 to 2.6.4 BREAKS nordlayer.db
```sh
# Run this if you are unable to use nordlayer after upgrade
rm /var/lib/nordlayer/nordlayer.db
systemctl restart nordlayer
nordlayer login
```

### Important
Original [repository](https://github.com/mearaj/nordlayer) was archived by [mearaj](https://github.com/mearaj) as they are longer a nordlayer user.<br>
I will be maintaining the package from now on.

If you run into any errors feel free to create an [issue](https://github.com/Sidicer/nordlayer/issues/new) or leave a comment [in AUR](https://aur.archlinux.org/packages/nordlayer)

To check latest official [nordlayer](https://nordlayer.com) version:
```sh
curl https://downloads.nordlayer.com/linux/latest/version -w "\n"
```
---
### Installing Nordlayer from AUR:
```sh
yay -S nordlayer
```

### Building the package manually:
```sh
git clone https://github.com/Sidicer/nordlayer.git
cd nordlayer
makepkg -si
# If 'makepkg -si' fails to install automatically:
sudo pacman -U nordlayer-2.6.5-0-x86_64.pkg.tar.zst
```
