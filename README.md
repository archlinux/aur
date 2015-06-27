# Arch Linux package for direnv

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

0. Download the release tar.gz and run sha256sum on it.
1. Edit PKGBUILD and change the `pkgver` and `sha256sums` fields.
2. Inside of vagrant run `cd /vagrant; mksrcinfo`
3. Commit & push

## Push to multiple origins

```bash
git clone ssh+git://aur@aur4.archlinux.org/direnv.git/ direnv-archlinux
cd direnv-archlinux
git remote set-url --add origin https://github.com/direnv/direnv-archlinux.git
```
