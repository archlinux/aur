```
@dmarcoux/tag-ag

AUR package for aykamko/tag: Instantly jump to your ag matches.
```

# Introduction

This repository is an
[AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository) package for
[aykamko/tag](https://github.com/aykamko/tag).  For any information regarding
`tag` itself, please refer to its [repository](https://github.com/aykamko/tag).
This AUR package is following GitHub releases of `tag`.  It doesn't follow every
commit on the `master` branch.

# Package Installation

Using your favorite [AUR
helper](https://wiki.archlinux.org/index.php/AUR_helpers), install the [tag-ag
AUR package](https://aur.archlinux.org/packages/tag-ag/) like this:

```bash
$ aura -A tag-ag
```

# Package Maintenance

This section is mostly notes on how this package is maintained.

### Write Access to the AUR

Have a look on the
[wiki](https://wiki.archlinux.org/index.php/Arch_User_Repository#Authentication)
if you don't already have write access to the AUR.

### Git Mirror

The `github.com/dmarcoux/tag-ag` repository is a mirror of the
`aur.archlinux.org/tag-ag` repository. Set it up by running the following
commands:

```bash
$ git clone git+ssh://aur@aur.archlinux.org/tag-ag.git
$ git remote set-url origin --add git@github.com:dmarcoux/tag-ag.git
```

### Generate the .SRCINFO file

The tool `mksrcinfo` provided by the [AUR package
`pkgbuild-introspection-git`](https://aur.archlinux.org/packages/pkgbuild-introspection-git)
is really useful to generate the `.SRCINFO` file. Simply run the command in the
repository's root directory to use it:

```bash
$ mksrcinfo
```

### Generate the sha256sums in the PKGBUILD file

The script `updpkgsums` (which comes with `pacman`'s version 4.1 or greater) is
a simple way to generate the sha256sums in the `PKGBUILD` file. It is as simple
as running the script in the repository's root directory:

```bash
$ updpkgsums
```

### Automation

For the steps `Generate the .SRCINFO file` and `Generate the sha256sums in the
PKGBUILD file`, I prefer to use a git pre-commit hook
([pre-commit.sh](pre-commit.sh)) to do this automatically. Set it up by running
the following command in the repository's root directory:

```bash
$ ln -s ../../pre-commit.sh .git/hooks/pre-commit
```
