# Maintainer: Alaksiej Stankievič <harald underscore zealot at tut dot by>

pkgname=aspell-be
_distname=aspell5-be
pkgver=0.01
pkgrel=1
pkgdesc="Belarusian dictionary for aspell."
url="http://aspell.net"
arch=('any')
license=('GPL2')
depends=('aspell')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/be/${_distname}-${pkgver}.tar.bz2")
md5sums=('61314a1672f98571b32d23486bbd43be')

build() {
  cd "${srcdir}/${_distname}-${pkgver}"
  
  ./configure
  make
}

package() {
  cd "${srcdir}/${_distname}-${pkgver}"
  
  make DESTDIR="${pkgdir}" install
}
 
