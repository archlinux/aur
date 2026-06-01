#!/bin/bash
# Runs INSIDE the Arch container as root (fakeroot): provision, then
# `yay -S <pkgname>` to build+install the package straight from the AUR
# (pulls the just-pushed PKGBUILD and resolves all AUR+repo deps).
set -xeuo pipefail
PKGNAME="$1"
pacman -Syu --noconfirm --needed \
  base-devel git sudo cmake ninja meson pacman-contrib \
  python-build python-installer python-wheel python-setuptools \
  pybind11 cuda cudnn gcc15
id builder &>/dev/null || useradd -m builder
echo 'builder ALL=(ALL) NOPASSWD: ALL' >/etc/sudoers.d/builder
chmod 440 /etc/sudoers.d/builder
chown -R builder:builder /home/builder
exec sudo -u builder \
  CUDAHOSTCXX=/usr/bin/g++-15 NVCC_CCBIN=/usr/bin/g++-15 CUDA_HOME=/opt/cuda \
  PKGNAME="$PKGNAME" bash -xeuo pipefail -c '
  cd /home/builder
  if ! command -v yay >/dev/null; then
    git clone --depth=1 https://aur.archlinux.org/yay-bin.git
    ( cd yay-bin && makepkg -si --noconfirm )
  fi
  # build+install from AUR (resolves AUR tensorrt, python-cutlass, etc.)
  yay -S --noconfirm --needed --answerdiff=None --answerclean=None --answeredit=None "$PKGNAME"
  echo "=== INSTALL CHECK ==="
  pacman -Q "$PKGNAME" && echo "INSTALLED-OK: $PKGNAME"
'
