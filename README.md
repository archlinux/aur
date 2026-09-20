# `python-i3-workspace-names-daemon`

The `PKGBUILD` packages the `i3-workspace-names-daemon` from the PyPI source distribution. The daemon renames i3 workspaces from the windows that they contain.

- `build()`: builds the wheel with `python-build`.
- `package()`: installs the wheel with `python-installer`, and installs the license file.

The source distribution contains no license file. The `PKGBUILD` therefore downloads `LICENSE` from the GitHub repository at the commit in the `_commit` literal. `pkg.sh` refreshes that commit hash with each checksum update.

Links:
- Upstream: https://github.com/cboddy/i3-workspace-names-daemon
- PyPI: https://pypi.org/project/i3-workspace-names-daemon/
- AUR: https://aur.archlinux.org/packages/python-i3-workspace-names-daemon
