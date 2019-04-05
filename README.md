# Arch Linux package for direnv

## Package updates

How to update the package from Arch on any system

0. Download the release tar.gz and run sha256sum on it.
1. Edit PKGBUILD and change the `pkgver` and `sha256sums` fields.
2. Run `mksrcinfo` (see below if you're not on Arch)
3. Commit & push

### Docker setup

Install [Docker](http://docker.com) then run `./docker-mksrcinfo`.

### Vagrant setup

Install [Vagrant](http://vagrantup.com) then

```bash
# Create vagrant box
vagrant up
vagrant ssh
# Install dev dependencies
sudo pacman -Syu
sudo pacman -S --needed base-devel pkgbuild-introspection
cd /vagrant
mksrcinfo
```

## Push to multiple origins

```bash
git clone ssh+git://aur@aur4.archlinux.org/direnv.git/ direnv-archlinux
cd direnv-archlinux
git remote set-url --add github https://github.com/direnv/direnv-archlinux.git
```

## Another way...

```bash
bash -c "updpkgsums && makepkg --printsrcinfo > .SRCINFO"
git push aur
git push github
```
