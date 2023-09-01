# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Israel Roldan <israel.alberto.rv@gmail.com>

# PKGBUILD variables.
pkgname=brightness-xrandr
pkgver=1.0.5
pkgrel=1
pkgdesc='Command-line tool that changes the brightness using the xrandr command.'
arch=(x86_64)
url='https://github.com/airvzxf/archlinux-brightness-xrandr'
license=(GPL3)
depends=(
  bash
  xorg-xrandr
  grep
  coreutils
  sed
  bc
)
source=('archlinux-brightness-xrandr-1.0.5.tar.gz::https://github.com/airvzxf/archlinux-brightness-xrandr/archive/refs/tags/v1.0.5.tar.gz')
md5sums=('cde853b5b8ed34d8a75a162b32c84d7b')
validpgpkeys=()

# PKGBUILD functions.
package() {
  cd "${srcdir}/archlinux-brightness-xrandr-1.0.5" || return
  install -Dm644 README.md "${pkgdir}/usr/share/doc/brightness-xrandr/README.md"

  cd "src" || return
  install -Dm755 "brightness-xrandr" "${pkgdir}/usr/bin/brightness-xrandr"
}
