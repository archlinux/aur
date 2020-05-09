# Maintainer: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=('canta-icon-theme')
pkgdesc="Flat icons for Canta GTK theme"
pkgver=2020.01.31
_pkgver=$(echo $pkgver | tr '.' '-')
_pkgname="Canta-theme-${_pkgver}"
pkgrel=1
arch=('any')
url="https://github.com/vinceliuice/Canta-theme"
license=('GPL2')
depends=('numix-circle-icon-theme')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('b00e5f7c926d80c180e37e8ca53f80c05b46c8cb5caf80270dad0b3a885bab00')

package() {
  mkdir -p "${pkgdir}"/usr/share/icons/Canta
  cp "${srcdir}"/${_pkgname}/src/icons/Canta/* "${pkgdir}"/usr/share/icons/Canta -R
}
