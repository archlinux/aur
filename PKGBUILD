# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=1.7.1
pkgrel=3
pkgdesc="A native YouTube client in QT. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL')
depends=('phonon')
install="${pkgname}.install"
source=("http://flavio.tordini.org/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('ce336b8cca8294f85d8e34b6a7828e38')

build() {
  cd "${srcdir}"/${pkgname}
  qmake
}

package() {
  cd "${srcdir}"/${pkgname}
  make install INSTALL_ROOT="${pkgdir}"
}
