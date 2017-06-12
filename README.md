# Gogs
PKGBUILD files for different versions of Gogs (Go Git Service).

## Open points
* ~~Systemd service support~~
* ~~better file structure~~
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
Config file is located under `/etc/gogs/app.ini`.

Enable and start systemd service:
```
$ systemctl enable gogs.service
$ systemctl start gogs.service
```

## Setup proxy in NGINX
Eg.
```
location ^~ /gogs/ {
  proxy_set_header        Host $host;
  proxy_set_header        X-Real-IP $remote_addr;
  proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
  proxy_set_header        X-Forwarded-Proto $scheme;
  proxy_pass              http://localhost:3000/;
}
```

## Logging
After start of the service every log entry is over journalctl displayable.
```
$ journalctl -f -u gogs.service
```
