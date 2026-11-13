# chromecast-sink-git

AUR packaging for the current `master` branch of
[Nerahikada/chromecast-sink](https://github.com/Nerahikada/chromecast-sink).
The recipe builds upstream source without patches. The pending receiver-volume
pull request and the user's fork are not part of this package unless upstream
merges them.

## Build

Use Arch Linux or an Arch Distrobox as a normal user, with `base-devel` installed:

```sh
makepkg -s
```

This fetches the complete upstream Git history, updates `pkgver`, fetches the
locked Rust dependencies in `prepare()`, and builds/tests offline using the
system Opus library. Tests exercise local UDP sockets and require no Cast device
or running PipeWire server. Only x86_64 is declared and tested.

The `cargo` build dependency can be provided by Arch's `rust` or `rustup`
package. If using rustup, install its stable toolchain first. For a Distrobox
with a separate home, ensure that Rust can locate that toolchain.

Install the resulting package when desired:

```sh
makepkg --install
/usr/bin/chromecast-sink --device "YOUR CAST DEVICE OR GROUP"
```

Select `Chromecast - <device name>` in the desktop's sound settings after
starting the program.

## Runtime and existing installations

The package depends on both `libpipewire` (shared libraries/plugins) and
`pipewire` (runtime configuration, including `client.conf`). Use the desktop's
existing PipeWire server and session manager. A Distrobox uses the host desktop's
audio socket; no package hook starts a second audio server or a caster.

The executable is installed to `/usr/bin/chromecast-sink`. An existing Cargo
installation or Distrobox launcher in `~/.cargo/bin` or `~/.local/bin` may appear
earlier in `PATH`; check `command -v chromecast-sink` and use the explicit
`/usr/bin` path inside the box to select this upstream package. The package does
not remove or replace user-managed Cargo installations.

## AUR maintenance

Regenerate metadata after changing the recipe:

```sh
makepkg --printsrcinfo > .SRCINFO
namcap PKGBUILD
```

Submit `PKGBUILD`, `.SRCINFO`, this README, and `.gitignore` to the AUR Git
repository. Build trees, binary packages, Cargo caches, and logs stay out of Git.
VCS packages track new upstream commits when rebuilt; a new AUR commit is needed
for recipe/dependency changes rather than every upstream revision.
