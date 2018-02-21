# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=qservicemenuconfig
pkgver=0.1.0
pkgrel=1
pkgdesc="MenuEditor for Dolphin"
arch=('x86_64')
url="https://www.opendesktop.org/s/Apps/p/1215612/"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base')
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1519187539/s/fa6e2337bf8cac91d566d7db09bc2d47/t/1519221075/u//QServiceMenuConfig-$pkgver.tgz")
sha256sums=('d66366c6737d12c20d704e7c5cd71c421a5b3cd8366422c1da78694a2ea20397')

build() {
  cd "QServiceMenuConfig-$pkgver"
  qmake-qt5
  make
}

package() {
  make -C "QServiceMenuConfig-$pkgver" DESTDIR="$pkgdir" install
}
