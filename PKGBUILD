# Maintainer: buckket <felix@buckket.org>

pkgname=redo-python
_pkgname=redo
pkgver=0.42
pkgrel=1
pkgdesc="Redo implementation in Python."
arch=("any")
license=("GPL")
url="https://github.com/apenwarr/redo"
depends=("python2")
makedepends=("python2-markdown" "python2-beautifulsoup3")
optdepends=("python-setproctitle: pretty output")
provides=("redo")
conflicts=("redo")
source=("https://github.com/apenwarr/redo/archive/redo-${pkgver}.tar.gz")
sha256sums=('c98379cf6c91544534b2c76929c13337acc013d5a7015deb01492a63b1339f3c')

package() {
  cd "${_pkgname}-${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

