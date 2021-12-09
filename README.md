# `bustd` Pacman Hooks

`bustd` is designed and expected to operate well in harsh environemnts that
may be resource hungry or memory starved. Therefore, extra preference is given to this
package to ensure that the latest (and greatest) version is always running.

![Hooks Directory Tree](resources/pacman-hooks-scrot.png "Bustd Pacman Hooks")

## Why are Pacman Hooks Used

`pacman` is arch's system package manager, therefore, any changes to our executable's
binary will be caused by this program. Whether that be an installation, upgrade, or
un-installation. So, from the momemt we install `bustd` the most recent version available
is running on our system. After an update is pushed to the *AUR*, `pacman` will be able
to fetch and install it. At this moment there is a newer version of the binary locally
available, but there is no indication that the old version will be turned-off and the new
version kicked-off. Pacman hooks solve this problem by forcing a restart of `bustd`
whenever the executable is modified.

---

## Hooks Used

- [Install](#hooks-used-install)
- [Remove](#hooks-used-remove)
- [Upgrade](#hooks-used-upgrade)

### Install<a name="hooks-used-install"></a>

This hook is triggered on the event that the package **bustd** is freshly installed
locally. Following this install, the program `bustd` will be immediately kicked-off via
a systemd service unit, which will also begin the program on system startup.

### Remove<a name="hooks-used-remove"></a>

This hook is triggered on the event that the package **bustd** is uninstalled from the
system. Once the uninstallation process is begun, before any files are removed, this hook
will halt the currently running instance and not begin another one, allowing for a smooth
uninstallation.

### Upgrade<a name="hooks-used-upgrade"></a>

This hook is triggered on the event that a new version of the package **bustd** becomes
available on the *AUR*. Once the executable has been upgraded, the currently running
instance is halted and an instance of the new version is started.

