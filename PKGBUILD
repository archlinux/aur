# Maintainer: Tim Savannah <kata198@gmail.com>

_basename=pacman-utils

pkgname=pacman-utils-data
_basever="2017_11_20"
pkgver="${_basever}"
pkgrel=4
pkgdesc="Additional data for use with pacman-utils (required for provides_upstream)"
# arch package url is https://github.com/kata198/pacman-utils-data-pkg
url="https://github.com/kata198/pacman-utils-data"
arch=(any)
license=(apache)
depends=(pacman-utils)
source=("https://github.com/kata198/pacman-utils-data/raw/master/providesDB")
sha512sums=("12b9cb62c25f76d9ee5f2ec1d490bc82ac409270fe355d0afbdbb430c9b724b297d86f6274bd8dd1a902302f23ae7deb501b469bf944d872b201b8566e72dbe9")


package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/var/lib/pacman"

  cp -f providesDB "${pkgdir}/var/lib/pacman/.providesDB"

}
