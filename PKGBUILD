# Maintainer: j605

pkgname=aspell-ta
pkgver=20040424
pkgrel=1
pkgdesc="Tamil spellcheck dictionary for aspell"
arch=('i686' 'x86_64')
url="http://aspell.net/"
license=('GPL')
depends=('aspell')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/ta/aspell6-ta-${pkgver}-1.tar.bz2")
sha256sums=('52f552f1a2c0fc53ed4eac75990ff75bccf3d5f1440ca3d948d96eafe5f3486a')

build() {
  cd "${srcdir}/aspell6-ta-${pkgver}-1"

  ./configure
  make
}

package() {
  cd "${srcdir}/aspell6-ta-${pkgver}-1"

  make DESTDIR="${pkgdir}" install
}
