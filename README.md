# i3-auto-arrange
This tool is designed to help you when you have many workspaces open in `i3`, and when you close some of them you end up with gaps in the numbering. Instead of arranging them one by one, you can run `i3-auto-arrange` and it will automatically do it for you.

### Installation
You can find this script as a package on the AUR (Arch User Repository): https://aur.archlinux.org/packages/i3-auto-arrange

Using a package helper such as `yay`, you could run `yay -S i3-auto-arrange`

Or, to install from source instead:
```
$ git clone https://github.com/denis-ismailaj/i3-auto-arrange.git
$ cd i3-auto-arrange
$ makepkg
```
### Dependencies
- `i3-wm` (obviously)
- `jq` (needed to parse output from `i3-msg`)
