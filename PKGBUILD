# Maintainer: buckket <buckket@cock.li>

pkgname=redo-python
_pkgname=redo
pkgver=0.41
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
sha256sums=('b7c6411185c58d05bafd0dabeb1f45873bc9bb87f7749705964792fa3fb9fedc')

package() {
  cd "${_pkgname}-${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

