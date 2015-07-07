# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=ffdiaporama-texturemate
pkgver=1.0
pkgrel=5
pkgdesc="Additional background-images for ffDiaporama from texturemate.com"
arch=('any')
url="http://ffdiaporama.tuxfamily.org"
license=('cc-by-3.0')
makedepends=('qt5-base')
source=(http://download.tuxfamily.org/ffdiaporama/Packages/Stable/ffdiaporama_texturemate_1.0.2014.0125.tar.gz)
md5sums=('d9169a9af48a6403086a8376859e6b5e')

build() {
  cd ffDiaporama_texturemate
  qmake-qt5 ffDiaporama_texturemate.pro
  make
}

package() {
  cd ffDiaporama_texturemate
  make install INSTALL_ROOT=$pkgdir
}