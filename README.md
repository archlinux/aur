**A simple tool to open magnet links** using a remote
[Transmission](https://github.com/transmission/transmission) daemon. Includes
a `.desktop` file for use with `xdg-open`. The remote server address is
configurable on a system-wide and per-user basis.

Requires that `transmission-remote` be available on the system. Includes
PKGBUILD for installation on Arch. Under Arch, `transmission-remote` is found in
the `transmission-cli` package.

# USAGE

**`addmag LINK`** where `LINK` is a magnet link or path to a torrent file

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
