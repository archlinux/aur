# [AUR] motion-openrc
Motion init scripts for OpenRC

## Install

This package is included in the Arch User Repository. Use your preferred method of package installation:

```
yaourt motion-openrc
```

To start Motion on boot add the service to a run level, for example `default`:

```
sudo rc-update add motion default
```

## System settings

This init script runs as `root` user by default (as the motion package does not create a user). This is not ideal. Create a motion user, grant it access to a PID directory (eg /run/motion/) and change settings accordingly in `/etc/conf.d/motion.conf` and `/etc/motion/motion.conf`.

## Uninstall

Don't forget to remove the service from boot first:

```
sudo rc-update del motion default
```

Now uninstall the package with pacman or your preferred manager:

```
pacman -R motion-openrc
```

## Bugs / feedback

Please report bugs etc at https://github.com/nochecksum/aur-motion-openrc/
Feel free to fork and pull request with improvements
