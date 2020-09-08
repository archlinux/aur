# Maintainer: bartus <szczepaniak.bartek+aur@gmail.com>

pkgname=meshconv
pkgver=1.29
pkgrel=1
pkgdesc="Converts to and from several popular 3D file formats"
url="https://www.patrickmin.com/meshconv/"
license=("GPL")
arch=('x86_64')
#depends=()
#groups=()
#makedepends=()
source=("http://www.patrickmin.com/meshconv/linux64/meshconv")
sha256sums=('50d1ce5dbedceb061289d7535ff62cfa81e7052b32241585a1e1c5b66ec4590d')

package() {
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

