# Arch Linux package for direnv

See https://aur4.archlinux.org/packages/direnv/ for how to clone the repo.

## Package updates

How to update the package from any system using
[Vagrant](http://vagrantup.com).

### Vagrant setup

```bash
# Create vagrant box
vagrant up
vagrant ssh
# Install dev dependencies
sudo pacman -Syu
sudo pacman -S --needed base-devel pkgbuild-introspection
```

### Update package version

0) Download the release tar.gz and run sha256sum on it.
1) Edit PKGBUILD and change the `pkgver` and `sha256sums` fields.
2) Inside of vagrant run `cd /vagrant; mksrcinfo`
3) Commit & push

