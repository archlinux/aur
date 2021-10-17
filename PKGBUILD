# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=ostrichriders
arch=('x86_64')
pkgver=0.6.5
pkgrel=2
pkgdesc="free clone of the arcade game Joust"
license=('GPL-3')
url="https://github.com/dulsi/ostrichriders"
depends=('sfml' 'fontconfig' 'hicolor-icon-theme' 'desktop-file-utils')
source=("https://github.com/dulsi/ostrichriders/archive/refs/tags/release-${pkgver}.tar.gz")

build() {
  cd $srcdir/$pkgname-release-${pkgver}
  make
}

package() {
  cd $srcdir/$pkgname-release-${pkgver}
  make DESTDIR=$pkgdir PREFIX=/usr install
}
sha256sums=('68a7714e58a45a2b4b62354f9627e5b976aa0bd49c9952dea4c92e942164067f')
