**A simple tool to open torrents and magnet links** using a remote
[Transmission](https://github.com/transmission/transmission) daemon. Includes
a `.desktop` file for use with `xdg-open`. The remote server address is
configurable on a system-wide and per-user basis.

Requires that `transmission-remote` be available on the system. Desktop
notifications require `notify-send`. Includes PKGBUILD for installation on Arch.
Under Arch, `transmission-remote` is found in the `transmission-cli` package.

# USAGE

**`addmag LINK`** where `LINK` is a magnet link or torrent file

# NOTIFICATIONS

Specify the `-n` flag to generate desktop notifications, ie.:

  `addmag -n LINK`

A notification will be created on success or failure. Failure notifications will
be marked critical.

# CONFIGURATION

**`addmag`** looks for configuration files in the following locations:

* `/etc/addmagrc`
* `~/.addmagrc`

These files should contain the address of the server running the Transmission
daemon and nothing else. Per-user configutation (in `~/.addmagrc`) overrides
the system configuration (in `/etc/addmagrc`).

# LICENSE & COPYRIGHT

Available under the terms of the **MIT license**. See included LICENSE file for
the full text of the license.

Copyright 2021 **aetherised** <<aetherised@gmail.com>>
