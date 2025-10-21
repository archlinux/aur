# cfgprf

tool for exporting and importing files in ~/.config, packages and AUR packages for Arch Linux.

it is on the AUR, so install with:
```
yay -S cfgprf
```
or
```
paru -S cfgprf
```

usage:
```
cfgprf --export --configs --profile ~/myconfig.cfgprf
```
```
cfgprf --import --configs --profile ~/myconfig.cfgprf
```
or
```
cfgprf -ecP ~/myconfig.cfgprf
```
```
cfgprf -icP ~/myconfig.cfgprf
```

use `--help` or `-h` for commands
