# Maintainer: حسين محمد <zidhussein@gmail.com>

pkgname=aspell-ar
pkgver=1.2
pkgrel=1
pkgdesc="Arabic dictionary for aspell"
url="http://aspell.net/"
license=('GPL')
depends=('aspell')
arch=('any')
source=(ftp://ftp.gnu.org/gnu/aspell/dict/ar/aspell6-ar-${pkgver}-0.tar.bz2)
md5sums=('154cf762bafdd02db419b62191138738')


build() {
  cd "${srcdir}/aspell6-ar-${pkgver}-0"
  ./configure
  make
}

package() {
  cd "${srcdir}/aspell6-ar-${pkgver}-0"
  make DESTDIR="$pkgdir" install
}
