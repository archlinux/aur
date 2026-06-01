#!/bin/bash
# Runs INSIDE the Arch Apptainer container as root (fakeroot).
# Provisions build deps, then builds the AUR package as a non-root 'builder'.
# Arg: $1 = package dir name under /build (e.g. python-torch-tensorrt)
set -xeuo pipefail
PKG="$1"

# --- base toolchain (gcc15 = CUDA 13's compatible host compiler) ---
pacman -Syu --noconfirm --needed \
  base-devel git sudo cmake ninja meson pacman-contrib \
  python-build python-installer python-wheel python-setuptools \
  pybind11 python-ninja cuda cudnn gcc15

# --- non-root builder user (makepkg refuses root) ---
id builder &>/dev/null || useradd -m builder
echo 'builder ALL=(ALL) NOPASSWD: ALL' >/etc/sudoers.d/builder
chmod 440 /etc/sudoers.d/builder

# fresh copy of the package sources into builder's home (writable)
rm -rf "/home/builder/$PKG"
cp -rT "/build/$PKG" "/home/builder/$PKG"
chown -R builder:builder /home/builder

# --- build as builder ---
exec sudo -u builder \
  CUDAHOSTCXX=/usr/bin/g++-15 NVCC_CCBIN=/usr/bin/g++-15 CUDA_HOME=/opt/cuda \
  PKG="$PKG" bash -xeuo pipefail -c '
  cd /home/builder
  # bootstrap yay (for AUR dep resolution)
  if ! command -v yay >/dev/null; then
    git clone --depth=1 https://aur.archlinux.org/yay-bin.git
    ( cd yay-bin && makepkg -si --noconfirm )
  fi
  cd "/home/builder/$PKG"
  # install ALL deps (repo via pacman, AUR built by yay)
  deps=$(bash -c "source ./PKGBUILD; echo \${depends[@]} \${makedepends[@]}")
  yay -S --noconfirm --needed --answerdiff=None --answerclean=None --answeredit=None $deps
  # refresh source checksums (tensorrt-llm could not be checksummed offline)
  updpkgsums
  # build (skip check: import tests need a GPU at runtime)
  makepkg -sf --noconfirm --nocheck
  cp -v PKGBUILD "/build/$PKG/PKGBUILD.built"   # capture corrected checksums
  ls -la *.pkg.tar.zst
  cp -v *.pkg.tar.zst "/build/$PKG/" || true
'
