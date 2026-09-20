# `openshell-bin`

The `PKGBUILD` installs the upstream release binaries for x86_64 and aarch64: `openshell`, `openshell-gateway`, `openshell-sandbox`, and `openshell-driver-vm`. It does not compile the sources.

- `build()`: converts the upstream Markdown manual pages with `pandoc`, and generates the Bash, Zsh, and Fish completions from the `openshell` executable.
- `check()`: compares the version output of each binary with `pkgver`.
- `package()`: installs the binaries, the manual pages, the completions, the user systemd unit for the gateway, and the example gateway configuration to `/usr/share/openshell-gateway/gateway.toml.default`.

Links:
- Upstream: https://github.com/NVIDIA/OpenShell
- Releases: https://github.com/NVIDIA/OpenShell/releases
- AUR: https://aur.archlinux.org/packages/openshell-bin

Portions are adapted from https://github.com/chadsr/aur-packages/tree/main/openshell

## `openshell.install`

Pacman install scriptlet. It prints how to enable the user gateway service after an installation, how to restart it after an upgrade, and which configuration and state directories stay on the disk after a removal.

## `LICENSE.packaging`

MIT license text for the packaging parts that this repository adapts from the `chadsr` package. The Apache-2.0 license of OpenShell itself comes from the upstream repository at build time.
