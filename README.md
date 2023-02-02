# gopass-fuse

## Installation

### Arch Derivate

```shell
$aurHelper -S gopass-fuse
```

### Andere Linux Distributionen

Zur Installation muss das Repository geklont werden, und dann folgendes ausgeführt werden.

```shell
git clone git@gitlab.teuto.net:technik/gopass-fuse.git
cd gopass-fuse
```

```shell
su
source PKGBUILD
pkgdir=/ srcdir=$PWD package
echo "Please install ${depends[@]}"
```

Danach muss der systemd daemon reloaded werden: `systemctl --user daemon-reload`, `systemctl --user enable systemd-tmpfiles-setup.service` und `systemd-tmpfiles --user --create --remove --boot` ausgeführt werden, damit alle benötigten Pfade existieren.

Nach dem einstecken des YubiKeys steht gopass-fuse unter den Pfaden `/run/user/$UID/gopass` und `$HOME/mnt/gopass` zur Verfügung.

## Migration

Wenn das Tool zuvor per `install.sh` installiert wurde, *muss* `${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user/gopass-fuse.service` gelöscht werden und `$HOME/.local/bin/gopass-fuse.py` kann gelöscht werden
