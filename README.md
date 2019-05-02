# Arch Linux package for direnv

## Package updates

How to update the package from Arch on any system:

1. Edit the PKGBUILD and change the `pkgver` field.
2. If you're on Arch, run `updpkgsums && makepkg --printsrcinfo > .SRCINFO`, and skip to the last step.
3. Download the release tar.gz and run sha256sum on it.
4. Update the `sha256sums` field in the PKGBUILD.
5. Use the Docker or Vagrant options below to update .SRCINFO.
6. Commit & push

### Docker setup

Install [Docker](https://www.docker.com), then run `./docker-srcinfo`.

### Vagrant setup

Install [Vagrant](https://www.vagrantup.com), then run the following:

```bash
# Create vagrant box
vagrant up
vagrant ssh
# Install dev dependencies
sudo pacman -Syu --needed base-devel
cd /vagrant
makepkg --printsrcinfo > .SRCINFO
```

## Push to multiple origins

```bash
git clone ssh://aur@aur.archlinux.org/direnv.git direnv-archlinux
cd direnv-archlinux
git remote set-url --add github https://github.com/direnv/direnv-archlinux.git
```
