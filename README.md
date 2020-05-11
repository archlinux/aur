### zectl-pacman-hook

It will create a boot environment prefixed with ``pacmanhook`` with ``zectl`` at each use of pacman. By default, it keeps only 1 boot environment, each use of pacman will erase previously created boot environment.

```bash
$ LANG=C sudo pacman -S sl
warning: sl-5.02-5 is up to date -- reinstalling
resolving dependencies...
looking for conflicting packages...

Packages (1) sl-5.02-5

Total Installed Size:  0.02 MiB
Net Upgrade Size:      0.00 MiB

:: Proceed with installation? [Y/n] y
(1/1) checking keys in keyring                     [------------------------] 100%
(1/1) checking package integrity                   [------------------------] 100%
(1/1) loading package files                        [------------------------] 100%
(1/1) checking for file conflicts                  [------------------------] 100%
(1/1) checking available disk space                [------------------------] 100%
:: Running pre-transaction hooks...
(1/1) Create a boot environment
• Destroyed pacmanhook-20200511T111356
• Created pacmanhook-20200511T111422
:: Processing package changes...
(1/1) reinstalling sl                              [------------------------] 100%
:: Running post-transaction hooks...
(1/1) Arming ConditionNeedsUpdate...
```

### Installation

Install aur package [zectl-pacman-hook]()

### Configuration

To keep more than 1 boot environment, use:
```
zectl set pacmanhook-prunecount=5
```

Be aware of your ``/boot`` size limitation.
To know ~ max prunecount you could set, try:
```bash
boot_size=$(du /boot | awk '{print $1}')
efi_size=$(df /efi --output=avail | sed '1d')
echo "$efi_size / $boot_size" | bc
```

We discuss about increasing max number of boot envs here:
https://github.com/johnramsden/zectl/issues/19

To disable the hook, use:
```
zectl set pacmanhook="no"
```

### Manual install
```
git clone https://github.com/eoli3n/zectl-pacman-hook
cd zectl-pacman-hook
makepkg -c
makepkg -si
```
