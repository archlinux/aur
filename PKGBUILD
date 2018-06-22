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
sha256sums=('05c8fa9f0c02b00426058844c981a05436594af0d813d124b17b66f10c5bdd9b')
build() {
  cd "${srcdir}/aspell-bn-master"

  ./configure
  make
}

package() {
  cd "${srcdir}/aspell-bn-master"

  make DESTDIR="${pkgdir}" install
}
