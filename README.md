# Arch Linux package for direnv

## Package updates

How to update the package from Arch on any system:

1. Edit the PKGBUILD and change the `pkgver` field.
2. If you're on Arch, run `./update` and skip to the last step.
3. If you're on a different system, use the Docker or Vagrant options below to update the checksums and .SRCINFO.
4. Commit & push

### Docker setup

Install [Docker](https://www.docker.com), then run `./docker-srcinfo`.

### Vagrant setup

Install [Vagrant](https://www.vagrantup.com), then run the following:

```bash
# Create vagrant box
vagrant up
vagrant ssh
# Install dev dependencies
sudo pacman -Syu --needed base-devel pacman-contrib
cd /vagrant
./update
```

## Push to multiple origins

```bash
git clone ssh://aur@aur.archlinux.org/direnv.git direnv-archlinux
cd direnv-archlinux
git remote set-url --add github https://github.com/direnv/direnv-archlinux.git
```
