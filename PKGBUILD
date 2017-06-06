# Maintainer: Tim Savannah <kata198@gmail.com>

_basename=pacman-utils

pkgname=pacman-utils-data
_basever="2017_06_03"
pkgver="${_basever}"
pkgrel=2
pkgdesc="Additional data for use with pacman-utils (required for provides_upstream)"
# arch package url is https://github.com/kata198/pacman-utils-data-pkg
url="https://github.com/kata198/pacman-utils-data"
arch=(any)
license=(apache)
depends=(pacman-utils)
source=("https://github.com/kata198/pacman-utils-data/raw/master/providesDB")
sha512sums=("71701c87f11d62591de29c374c44942ba11a27a163aea7e669c244a574d9fdc06f3289a9c1173c9ba7b8ae43161be99b09438a30d26485b8393b448e8cc3263d")


package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/var/lib/pacman"

  cp -f providesDB "${pkgdir}/var/lib/pacman"

}
