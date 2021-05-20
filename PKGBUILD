# Maintainer: Christopher KOBAYASHI <software plus aur at disavowed dot jp>

pkgname="dahdi-linux-ck-git-dkms"
pkgdesc="DAHDI drivers for Asterisk, patched to support older cards"
pkgver=git
pkgrel=1
arch=("i686" "x86_64")
url="http://www.asterisk.org/"
license=("LGPLv2")
depends=('dkms')
makedepends=("linux-headers")
conflicts=("dahdi")
source=("git+https://github.com/christopherkobayashi/dahdi-linux.git")

sha256sums=('SKIP')

package() {
  cd "${srcdir}"
  local install_dir="${pkgdir}/usr/src/dahdi-linux-${pkgver}"

  # Copy sources
  cp -r "${srcdir}"/dahdi-linux/* "${install_dir}"/
}
