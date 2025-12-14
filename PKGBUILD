# Maintainer: kpnicz@gmail.com
pkgname=proton-cachyos-custom
pkgver=1.0
pkgrel=3
pkgdesc="Proton CachyOS prebuilt"
arch=('x86_64')
url="https://github.com/Homisiak/proton-cachyos-bin"
license=('custom')
conflicts=('proton-cachyos')
provides=('proton')
depends=(
  bash
  coreutils
  curl
  dbus
  desktop-file-utils
  diffutils
  freetype2
  gcc-libs
  gdk-pixbuf2
  glibc
  hicolor-icon-theme
  libxcrypt
  libxcrypt-compat
  libxkbcommon-x11
  lsb-release
  lsof
  nss
  python
  ttf-font
  usbutils
  vulkan-driver
  vulkan-icd-loader
  xdg-user-dirs
  xorg-xrandr
  xz
  zenity
)
depends_x86_64=(
  lib32-alsa-plugins
  lib32-fontconfig
  lib32-gcc-libs
  lib32-glibc
  lib32-libgl
  lib32-libgpg-error
  lib32-libnm
  lib32-libva
  lib32-libx11
  lib32-libxcrypt
  lib32-libxcrypt-compat
  lib32-libxinerama
  lib32-libxss
  lib32-nss
  lib32-pipewire
  lib32-systemd
  lib32-vulkan-driver
  lib32-vulkan-icd-loader
)
optdepends=(steam)
source=("git+https://github.com/Homisiak/proton-cachyos-bin.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/proton-cachyos-bin"
    cp -r usr "$pkgdir/"
}
