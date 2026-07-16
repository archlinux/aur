# Publishing nodewipe to the AUR

This publishes `nodewipe-bin` — installs the prebuilt release binary
directly, no Rust toolchain needed on the installer's machine.

## One-time setup

1. Create an account at https://aur.archlinux.org/register/
2. Add an SSH public key to your AUR account
3. Install packaging tools: sudo pacman -S --needed base-devel pacman-contrib git

## Fill in the real checksum

cd packaging/aur
updpkgsums

## Test locally before publishing

makepkg -si

## Generate AUR metadata

makepkg --printsrcinfo > .SRCINFO

## Publish

git init
git remote add origin ssh://aur@aur.archlinux.org/nodewipe-bin.git
git add PKGBUILD .SRCINFO
git commit -m "Initial import: nodewipe-bin 0.3.0"
git push -u origin master
