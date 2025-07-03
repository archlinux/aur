runit-service
=============

A custom tool to manage runit services.<br>
The main goal is to provide a `systemctl` like command to easily manage complex commands.

Additions
---------

- runit-journal: A service that listens to kernel logs.

Usage
-----

- Install:
```shell
makepkg -si
```

- Update sha256sum:
```shell
makepkg -g >> PKGBUILD
```

