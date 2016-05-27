# Gogs
PKGBUILD files for different versions of Gogs (Go Git Service).

## Open points

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