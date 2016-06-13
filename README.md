```
@dmarcoux/tag-ag

AUR package for aykamko/tag: Instantly jump to your ag matches.
```

# Introduction

This repository is an [AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository) package for [aykamko/tag](https://github.com/aykamko/tag).
For any information regarding `tag` itself, please refer to its [repository](https://github.com/aykamko/tag).
This AUR package is following GitHub releases of `tag`.
It doesn't follow every commit on the `master` branch.

# Package Installation

Using your favorite [AUR helper](https://wiki.archlinux.org/index.php/AUR_helpers), install the [tag-ag AUR package](https://aur.archlinux.org/packages/tag-ag/) like this:

```bash
$ aura -A tag-ag
```

# Package Maintenance

This section is mostly notes, just in case I forget something about maintaining this package.

The GitHub repository is a mirror of the `aur.archlinux.org` repository.
This was setup with the following commands:

```bash
$ git remote set-url origin --add git+ssh://aur@aur.archlinux.org/tag-ag.git
$ git remote set-url origin --add git@github.com:dmarcoux/tag-ag.git
```

To generate the `.SRCINFO` file, I use a tool provided by the [AUR package `pkgbuild-introspection-git`](https://aur.archlinux.org/packages/pkgbuild-introspection-git).
It is as simple as running the following command in the repository's root directory:

```bash
$ mksrcinfo
```
