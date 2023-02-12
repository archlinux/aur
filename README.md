# OneDev AUR package

Here you can find the source of the onedev AUR package, you can view the
AUR package [here](https://aur.archlinux.org/packages/onedev).

## Installing the package

Due to the issues with JSW which onedev relies upon, the installation
and upgrade process has been made slightly more difficult.

To install the package, it is simple as installing `onedev`, and then
starting `onedev.service`.

## Upgrading the package

Upgrading the package is more difficult, as onedev requires the new code
to "patch" the old code, migrating the data with it. This is why the
onedev package is split into two, `onedev` which provides the complete
onedev package including the software, user, and systemd service file.
However for upgrades, you also must have `onedev-new` which only
contains the latest onedev code.

To update install the latest version of `onedev-new` and then run the
following command:

`/opt/onedev-new/bin/upgrade.sh /opt/onedev`

This will update you current onedev installation, you may now remove
`onedev-new`:

`pacman -Rs onedev-new`

Dont forget to remove the remaining files:

`rm -rf /opt/onedev-new`

Now you can install the latest version of `onedev`, overwriting any
changes onedev-new has made to the codebase, ensure to use the following
flag to prevent "File already exists" errors:

`--overwrite "*.*"`

This will tell pacman to overwrite any duplicate files.

The Onedev package is now ready to use, you may now start
`onedev.service`.

Note: This package will be refined as more development takes place, this
is currently a crude method of being able to update onedev properly.
