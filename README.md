# Packaging for Arch Linux

This folder contains the `PKGBUILD` script for building the `radicle-desktop`
Arch Linux package.

## Arch User Repository

This folder is mirrored to the Arch User Repository as
[`radicle-desktop`][aur-pkg] so user can install it from there.

Whenever a change is made to this folder it is synched to the AUR using the
following command:

```bash
git subtree -P arch push ssh://aur@aur.archlinux.org/radicle-desktop.git master
```

Before you push any changes, make sure that the package builds properly, see
“Build QA” below.

You need to be a maintainer of the `radicle-desktop` to be allowed to push
changes. To become a maintainer ask one of the existing maintainers to add you.

## Build QA

There is a [Woodpecker CI workflow][workflow] to ensure that the package builds
correctly on Arch Linux.

You can run the workflow locally.

```bash
woodpecker-cli \
    exec .woodpecker/build-arch.yaml \
    --repo-path . \
    --volumes paccache:/var/cache/pacman,builder:/home/builder
```

Using `--volumes` is optional and improves caching between multiple runs.

[aur-pkg]: https://aur.archlinux.org/packages/radicle-desktop
[workflow]: ../.woodpecker/build-arch.yaml
