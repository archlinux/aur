# aerial-lock

Versioned AUR package for [aerial-lock](https://github.com/atmosphera-dev/aerial-lock),
a Wayland session lock with video backgrounds and an idle/session companion.

The package builds the pinned release tarball, conflicts with `aerial-lock-git`,
and preserves local changes to `/etc/pam.d/aerial-lock` through pacman's backup handling.
Runtime and optional dependencies are declared in `PKGBUILD`; `wayland-protocols`
and Arch's `base-devel` group are required to build.

## Build

On Arch Linux with the declared dependencies installed:

```sh
makepkg -si
```

## Maintenance

Install the metadata hook after cloning:

```sh
install -m755 pre-commit.sh .git/hooks/pre-commit
```

When `PKGBUILD` is staged, the hook generates and stages `.SRCINFO` and runs
`namcap PKGBUILD` in rootless Podman. It never runs makepkg on the host.
Update `pkgver` and the tarball SHA-256 for a new release; reset `pkgrel` to 1.
For packaging-only changes, increment `pkgrel` instead.

Packaging files are licensed under 0BSD; upstream aerial-lock uses GPL-3.0-or-later.
