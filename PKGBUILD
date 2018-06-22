# Maintainer: Pavel Sayekat; mail to <pavelsayekat@gmail.com>

pkgname=aspell-bn
pkgver=0.02
pkgrel=1
pkgdesc="Bengali spellcheck dictionary for aspell"
arch=('i686' 'x86_64')
url="http://aspell.net/"	
license=('GPL2')
depends=('aspell')
source=("https://gitlab.com/Pavel-Sayekat/aspell-bn/-/archive/master/aspell-bn-master.tar.bz2")
sha256sums=('56386243e3b6ebbd6167ac37814f27ad51d94aa9e9a7c9d93020c41f2d38cf99')
build() {
  cd "${srcdir}/aspell-bn-master"

  ./configure
  make
}

package() {
  cd "${srcdir}/aspell-bn-master"

  make DESTDIR="${pkgdir}" install
}
