# hyprlogin-pkg

Local Arch package wrapper for the `hyprlogin` source tree in `../hyprlogin`.

Build and install with:

```sh
cd /home/smiley/Workspace/hyprlogin-pkg
makepkg -f
sudo pacman -U ./hyprlogin-*.pkg.tar.zst
```
