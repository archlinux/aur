# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=ffdiaporama-rsc
pkgver=2.1
pkgrel=2
pkgdesc="Recource-files for ffDiaporama"
arch=('any')
url="http://ffdiaporama.tuxfamily.org"
license=('GPL2')
makedepends=('qt5-base')
source=(http://download.tuxfamily.org/ffdiaporama/Packages/Stable/ffdiaporama_rsc_2.1.2014.0209.tar.gz)
md5sums=('7e4c9da2c28fbb1850e140aee348096f')

build() {
  cd ffDiaporama_rsc
  qmake-qt5 ffDiaporama_rsc.pro
  make
}

package() {
  cd ffDiaporama_rsc
  make install INSTALL_ROOT=$pkgdir
}