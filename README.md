# ACNF/Arch - Advanced Command-Not-Found for Arch linux

## What this is?

This is a extensible Command-Not-Found-Handle (exclusively) for Bash. Originally only for Arch, but maybe someone will ports this.

## Motivation

I originally was an Ubuntu user, and i really liked the Command suggestion. It was so useful. Then i switched to CachyOS, and I missed this feature. I found out that `pkgfile` supports it, but it was not AUR- or Flatpak-Aware. So i started this mini-project.

## Porting

You are free to port it to other Distros like Ubuntu or Fedora or SUSE, just remember to rename it (eg. "ACNF/Ubuntu"). 

You can even keep the `acnfctl` tool unmodified! You only need to change the `handler.bash`!

## How to install it?

### Directly
Download it from [Github](https://github.com/TobToast/acnf_arch), move it into some directory, move `acnfctl` to `/usr/bin`, run `acnfctl enable` and you're almost done! Now you just need to create `/etc/profile.d/acnf.sh`, make it executable (`sudo chmod +x /etc/profile.d/acnf.sh`), and write the following:

    export ACNF_INSTALL_DIR="/path/to/acnf"
    export ACNF_HOOK_DIR="$ACNF_INSTALL_DIR/hooks"

### Package Manager
For Arch Linux, you can use an AUR Helper like `paru` or `yay` to install the `acnf` package.

### Reboot recommended!
Yes, after the installation using either way, you should reboot. Or at least log out of the session (not just the shell instance) and log in again.

I know, it's hard to believe, on Linux!

### acnfctl
In both cases, you also get a tool called `acnfctl`, which is very useful for managing the system. Read the (english & german localized btw 😎) help page (`acnfctl help`) for more info.

## How it works

So there is the main file, `handler.bash` which suggest the installation of packages that were found in the official Arch Repos (pacman -F) which provide the missing command. Very simple. And in Color!

If the command was not found inside one of the main Arch Repos, the script calls the hooks in the correct order (using find & sort).

You can define the package manager using `ACNF_PACKAGE_MANAGER` (eg. `pacman`) and a prefix for it, using `ACNF_PACKAGE_MANAGER_CMD_PREFIX` (eg. `sudo`).

## Overview of all Environment Vars

- `ACNF_HOOK_DIR`: Specify Directories where the hooks are stored. (Colon-separated list) Default: ARCH_INSTALL_DIR/hooks
- `ACNF_INSTALL_DIR`: Installation Directory of acnf. This is where the handler.bash script should live in
- `ACNF_PACKAGE_MANAGER`: Specify which package manager to use. Default: `pacman`
- `ACNF_PACKAGE_MANAGER_CMD_PREFIX`: Specify prefix of the package manager command (eg. `sudo` (also default with `pacman`) or `nice`).

- `TEXTDOMAIN`: Internally used for translation (`gettext`)
- `TEXTDOMAINDIR`: Internally Also used for translation (`gettext`)

## Notes

Please note that the scripts are very bash-heavy, and definitely not POSIX-compliant, so good luck porting!

Also note that handler.bash should ALWAYS be located in $ACNF_INSTALL_DIR/

Only English & German translations are currently done... You might also find it fun to translate it in many other languages!
