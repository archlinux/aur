# opa-regal

![AUR version](https://img.shields.io/aur/version/opa-regal?label=AUR)
![AUR votes](https://img.shields.io/aur/votes/opa-regal)

This repository contains build files to build the Arch Linux package `opa-regal`. Instead of building the package
yourself, it can also be obtained from the following private repository. The section [*Obtaining pre-built
packages from a repository*](#obtaining-pre-built-packages-from-a-repository) describes all necessary steps.

## Build

Clone this repository and use `makepkg` to build the package by yourself. For example:

```bash
git clone https://aur.archlinux.org/opa-regal.git
cd opa-regal
makepkg
```

## Yay

The build files are also available via AUR and can be installed via an AUR helper like `yay`.

```bash
yay --sync --aur opa-regal
```

## Obtaining pre-built packages from a repository

Instead of building the packages locally, it is also possible to configure an additional repository to install the
package directly via `pacman`. The following commands are used to create the repository, configure the GPG key to verify
the packages and install the package:

```bash
# Create drop-in directory
sudo mkdir --parents /etc/pacman.d/repos

# Create configuration of the repository 'volker.raschek'
sudo tee /etc/pacman.d/repos/volker.raschek.conf > /dev/null <<'EOF'
[volker.raschek]
SigLevel = PackageRequired TrustedOnly
Include = /etc/pacman.d/repos/volker.raschek.list
EOF

# Create mirror list of the repository 'volker.raschek'
sudo tee /etc/pacman.d/repos/volker.raschek.list > /dev/null <<'EOF'
Server = https://aur.cryptic.systems/$repo/$arch
EOF

# Import gpg key of the repository 'volker.raschek'
sudo pacman-key --keyserver hkps://keys.openpgp.org --recv-keys 9B146D11A9ED6CA7E279EB1A852BCC170D81A982

# Extend existing pacman configuration of the repository 'volker.raschek'
sudo tee -a /etc/pacman.conf > /dev/null <<EOF
Include = /etc/pacman.d/repos/*.conf
EOF

# Update pacman cache
sudo pacman --sync --refresh

# Install the package and receive updates directly via pacman :)
sudo pacman --sync opa-regal
```
