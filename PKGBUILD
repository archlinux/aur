# Maintainer: Tim Savannah <kata198@gmail.com>

_basename=pacman-utils

pkgname=pacman-utils-data
_basever="2018_04_17"
pkgver="${_basever}"
pkgrel=1
pkgdesc="Additional data for use with pacman-utils (required for provides_upstream)"
# arch package url is https://github.com/kata198/pacman-utils-data-pkg
url="https://github.com/kata198/pacman-utils-data"
arch=(any)
license=(apache)
depends=(pacman-utils)
source=("https://github.com/kata198/pacman-utils-data/archive/2018_04_17.tar.gz")
sha512sums=("ad7ad6339a9aa7271f1e7de147423fde9379cffd1923b90847c829582f6e88c382a3a08d22f0f3f2681abc2840aeda8b151b01f2e74a7f38adebd64152cb03dd")


package() {
  cd "${srcdir}/${pkgname}-${_basever}"

  mkdir -p "${pkgdir}/var/lib/pacman"

  cp -f providesDB "${pkgdir}/var/lib/pacman/.providesDB"

}
