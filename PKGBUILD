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
sha256sums=('d20932117f8fdd91ef37c30f0a54d2261ead25654c04ce3fb72d7fadd4069113')
build() {
  cd "${srcdir}/aspell-bn-master"

  ./configure
  make &>/dev/null
}

package() {
  cd "${srcdir}/aspell-bn-master"

  make DESTDIR="${pkgdir}" install
}
