# Maintainer: Tim Savannah <kata198@gmail.com>

_basename=pacman-utils

pkgname=pacman-utils-data
_basever="2018_07_14"
pkgver="${_basever}"
pkgrel=1
pkgdesc="Additional data for use with pacman-utils (required for provides_upstream)"
# arch package url is https://github.com/kata198/pacman-utils-data-pkg
url="https://github.com/kata198/pacman-utils-data"
arch=(any)
license=(apache)
depends=(pacman-utils)
source=("https://github.com/kata198/pacman-utils-data/archive/${_basever}.tar.gz")
sha512sums=("6d1480b1e580821cd8b0c10ce6da7866d18721d4a8f5725b7092f55e6586bcf2266d5fc6afbae2324d2c5151d7c751d871c82024357eca67ddda36da5dd8a573")


package() {
  cd "${srcdir}/${pkgname}-${_basever}"

  mkdir -p "${pkgdir}/var/lib/pacman"

  cp -f providesDB "${pkgdir}/var/lib/pacman/.providesDB"

}
