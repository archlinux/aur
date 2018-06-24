# Maintainer: Pavel Sayekat; mail to <pavelsayekat@gmail.com>

pkgname=aspell-bn
pkgver=0.02
pkgrel=1
pkgdesc="Bengali spellcheck dictionary for aspell"
arch=('any')
url="http://aspell.net/"	
license=('GPL2')
depends=('aspell')
source=("https://gitlab.com/Pavel-Sayekat/aspell-bn/-/archive/master/aspell-bn-master.tar.bz2")
sha256sums=('3cf83222d80b8e3f0d247af5bea6ae0142f57dfa4c631968785cba8bfe3750f0')
build() {
  cd "${srcdir}/aspell-bn-master"

  ./configure
  make &>/dev/null
}

package() {
  cd "${srcdir}/aspell-bn-master"

  make DESTDIR="${pkgdir}" install
}
