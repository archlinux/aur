# Maintainer: Tim Savannah <kata198@gmail.com>

_basename=pacman-utils

pkgname=pacman-utils-data
_basever="2017_06_07"
pkgver="${_basever}"
pkgrel=3
pkgdesc="Additional data for use with pacman-utils (required for provides_upstream)"
# arch package url is https://github.com/kata198/pacman-utils-data-pkg
url="https://github.com/kata198/pacman-utils-data"
arch=(any)
license=(apache)
depends=(pacman-utils)
source=("https://github.com/kata198/pacman-utils-data/raw/master/providesDB")
sha512sums=("15af554218f605b17d3de0212e4952b1a15fbe162f238b3258e5ea0a4b3648b9ab377f8559562f3c2b3cac8053bd416a084eb1c10abcdbff5e640ebf3e9ec050")


package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/var/lib/pacman"

  cp -f providesDB "${pkgdir}/var/lib/pacman/.providesDB"

}
