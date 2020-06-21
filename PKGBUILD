# Maintainer: buckket <felix@buckket.org>

pkgname=redo-python
_pkgname=redo
pkgver=0.42c
pkgrel=1
pkgdesc="Redo implementation in Python."
arch=("any")
license=("GPL")
url="https://github.com/apenwarr/redo"
depends=("python")
makedepends=("python-beautifulsoup4")
optdepends=("python-setproctitle: pretty output")
provides=("redo")
conflicts=("redo")
source=("https://github.com/apenwarr/redo/archive/redo-${pkgver}.tar.gz")
sha256sums=('6f1600c82d00bdfa75445e1e161477f876bd2615eb4371eb1bcf0a7e252dc79f')

package() {
  cd "${_pkgname}-${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

