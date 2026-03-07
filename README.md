# Interception-fluent

Check the [source](https://github.com/Lixissimus/fluent) README for information on how to use this package

## Build locally

Install `devtools`:

```sh
sudo pacman -S devtools
```

Build in chroot:

```sh
pkgctl build
```

Build and also update checksum:

```sh
pkgctl build --update-checksums
```

## Add new ssh key

Create keypair in file `aur` and `aur.pub`, then add to `~/.ssh/config`

```
Host aur.archlinux.org
  IdentityFile ~/.ssh/aur
  User aur
```
