# cfgprf

a tool for exporting and importing files in XDG_CONFIG_HOME, /etc/, dot directories in HOME, pacman packages & AUR packages for Arch Linux.

it is [available on the AUR](https://aur.archlinux.org/packages/cfgprf)

usage examples:

to export just ~/.config/
```
cfgprf --export --configs --profile ~/myconfig.cfgprf
cfgprf --import --configs --profile ~/myconfig.cfgprf
```
or
```
cfgprf -ecP ~/myconfig.cfgprf
cfgprf -icP ~/myconfig.cfgprf
```

see `--help` or `-h` for more info
