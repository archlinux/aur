# Gogs
PKGBUILD files for different versions of Gogs (Go Git Service).

## Open points
* ~~Systemd service support~~
* better file structure
* ~~Publishing on https://aur.archlinux.org~~
* Test MariaDB and PostgreSQL installation
* ~~Test on armv6h (Raspberry Pi), armv7h (Cubieboard 2) and on x86_64~~
* Documentation for usage and configuration

## Install
```
$ tar -xvzf /<path to Tarball>/gogs-*.tar.gz
$ cd <package-name>
$ makepkg
$ pacman -U gogs-*.tgz
```

## Configuration
Enable and start systemd servicd
```
$ systemctl enable gogs.service
$ systemctl start gogs.service
```

## Logging
After start of the service every log entry is over journalctl displayable.
```
$ journalctl -f -u gogs.service
```
