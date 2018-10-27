# Maintainer: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=('canta-icon-theme')
pkgdesc="Flat icons for Canta GTK theme"
pkgver=2018.10.12
_pkgver=$(echo $pkgver | tr '.' '-')
_pkgname="Canta-theme-${_pkgver}"
pkgrel=1
arch=('any')
url="https://github.com/vinceliuice/Canta-theme"
license=('GPL2')
depends=('numix-circle-icon-theme')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('41eb317f98fe1b4aef55f6facc55ba05ca86896acf664ac1ae3d52185fa5941d')

package() {
  mkdir -p "${pkgdir}"/usr/share/icons/Canta
  cp "${srcdir}"/${_pkgname}/src/icons/Canta/* "${pkgdir}"/usr/share/icons/Canta -R
}
