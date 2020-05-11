# Maintainer: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=('canta-icon-theme')
pkgdesc="Flat icons for Canta GTK theme"
pkgver=2020.01.31
_pkgver=$(echo $pkgver | tr '.' '-')
_pkgname="Canta-theme-${_pkgver}"
pkgrel=2
arch=('any')
url="https://github.com/vinceliuice/Canta-theme"
license=('GPL2')
depends=('numix-circle-icon-theme')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('c08e3d10eb5625024cb778de3f0901bcc73c07959b090e821ca69c0ae15e06b3')

package() {
  mkdir -p "${pkgdir}"/usr/share/icons/Canta
  cp "${srcdir}"/${_pkgname}/src/icons/Canta/* "${pkgdir}"/usr/share/icons/Canta -R
}
