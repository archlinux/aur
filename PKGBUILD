# Maintainer: Tim Savannah <kata198@gmail.com>

_basename=pacman-utils

pkgname=pacman-utils-data
_basever="2018_12_12"
pkgver="${_basever}"
pkgrel=1
pkgdesc="Additional data for use with pacman-utils (required for provides_upstream)"
# arch package url is https://github.com/kata198/pacman-utils-data-pkg
url="https://github.com/kata198/pacman-utils-data"
arch=(any)
license=(apache)
depends=(pacman-utils)
source=("https://github.com/kata198/pacman-utils-data/archive/${_basever}.tar.gz")
sha512sums=("632495a7064ef8a6a9bbd573d648cfee2d13292d1f17b59e0e3451bdf2a8f3f4baf4e901380ffbd0af15bd23e37a31da43747d1d5a565d13204add905efbd136")


package() {
  cd "${srcdir}/${pkgname}-${_basever}"

  mkdir -p "${pkgdir}/var/lib/pacman"

  cp -f providesDB "${pkgdir}/var/lib/pacman/.providesDB"

}
