# AnyPS5 for Arch Linux

Maintainer: Good Vibes <good_vibes@fastmail.com>
Upstream: https://github.com/boykopovar/AnyPS5

This package builds release 0.1.1 and the exact third-party revisions recorded
by that release. Upstream's bundled dependencies are retained for compatibility.

Build and install:

```sh
makepkg -si
```

The package installs `relinker` and the patched Linux system libraries in
`/usr/lib/anyps5`. Convert a decrypted input ELF for Linux with:

```sh
relinker --rpath /usr/lib/anyps5 source/input.elf app.elf
chmod +x app.elf
./app.elf
```

Place the game's resources in `app0/` beside the output executable, following
upstream's usage documentation. For a portable directory, copy the `.prx` files
from `/usr/lib/anyps5/` into `libs/` beside the output and omit `--rpath`.
The installed libraries target Linux; Windows output needs Windows libraries.

Running converted applications requires a supported Vulkan GPU and its driver.
Package validation does not establish game compatibility.
