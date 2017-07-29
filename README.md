## Windscribe VPN CLI for Arch Linux

**Update: You can now install this package from AUR: k**

### Overview
This repository contains the files necessary to build Windscribe VPN CLI for Arch Linux. Currently, Windscribe's CLI is in open beta, so users should anticipate breakages.

### Installing
In order the install Windscribe's CLI, use the following instructions:

1. Clone this repository onto your local machine.
2. `cd` into the cloned repository.
3. Execute `makepkg -cs` to build the package.
4. After the build process is finished, run `sudo pacman -U windscribe-cli-1.0-1-any.pkg.tar` to install the package.
5. Close out of any active terminals (this is so that bash autocomplete works)
6. Make sure that the windscribe daemon is running: `systemctl status windscribe.service`
7. Now running `windscribe` in your terminal should bring-up the CLI

![Terminal](images/ready.png)

### Resources
[Windscribe](https://windscribe.com/)

[Windscribe Linux Download](https://windscribe.com/guides/linux)