# i3-auto-arrange

Opening and closing many workspaces in `i3` can lead to gaps in numbering. 

Instead of rearranging them yourself, you can have `i3-auto-arrange` do it for you.

### Installation

This script is available as an [AUR package](https://aur.archlinux.org/packages/i3-auto-arrange).

You can use an AUR helper such as `yay` to install it:
     
    yay -S i3-auto-arrange

Or, to install from source:
```
git clone https://github.com/denis-ismailaj/i3-auto-arrange.git
cd i3-auto-arrange
makepkg
sudo pacman -U i3-auto-arrange-*.pkg.tar.xz
```

> [!NOTE]
> `i3-auto-arrange` depends on `jq` in order to parse the outputs of `i3-msg`

### Usage

`i3-auto-arrange` is most useful when used as a keyboard shortcut.

To do that, open your `i3` config file:

    vim ~/.config/i3/config  # or ~/.i3/config

and bind your preferred key combination to running `i3-auto-arrange`:

    bindsym <key combination> exec i3-auto-arrange
