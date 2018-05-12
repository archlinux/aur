# Maintainer: Tim Savannah <kata198@gmail.com>

_basename=pacman-utils

pkgname=pacman-utils-data
_basever="2018_05_12"
pkgver="${_basever}"
pkgrel=1
pkgdesc="Additional data for use with pacman-utils (required for provides_upstream)"
# arch package url is https://github.com/kata198/pacman-utils-data-pkg
url="https://github.com/kata198/pacman-utils-data"
arch=(any)
license=(apache)
depends=(pacman-utils)
source=("https://github.com/kata198/pacman-utils-data/archive/${_basever}.tar.gz")
sha512sums=("b4e0078cc2f548e16d7bfe42fec756dfb247408af6ee7eb984ab41268675a2e529d89c0ac8f42324ce744155a30348ca0a59c3e17ddd718b878171069e64beeb")


package() {
  cd "${srcdir}/${pkgname}-${_basever}"

  mkdir -p "${pkgdir}/var/lib/pacman"

  cp -f providesDB "${pkgdir}/var/lib/pacman/.providesDB"

}
