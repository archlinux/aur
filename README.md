## Approved, unofficial repo of [Nordlayer](https://nordlayer.com) VPN package for Linux (esp [ArchLinux](https://archlinux.org/)) 

## Important! ##
#### This repository is now archived as I am no longer a nordlayer user and ####
#### hence will not be able to maintain it. You are welcome to fork it if interested ####


To check if the repo is upto date with the official
[Nordlayer](https://nordlayer.com), run the following from
console/terminal.<br>
Make sure [curl](https://curl.se/) is installed on your system.

```
curl https://downloads.nordlayer.com/linux/latest/version -w "\n"
```
For any issues, please create an issue or
[Add comment here](https://aur.archlinux.org/packages/nordlayer)

For Arch Linux Users,
* Clone this repo
* Change to cloned repo ```cd nordlayer``` 
* MakePkg ```makepkg -si```
* Install Package ```sudo pacman -U "package_name_pkg.tar.zst"``` where
<b>package_name_pkg.tar.zst</b> is the name of package generated from <b>makepkg -si</b>

### Thanks! ###