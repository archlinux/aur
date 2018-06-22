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
sha256sums=('7beee4cf3e4431012fd57c07d8f762617c0a1e04bcb2e889a71d21b238516fca')
build() {
  cd "${srcdir}/aspell-bn-master"

  ./configure
  make
}

package() {
  cd "${srcdir}/aspell-bn-master"

  make DESTDIR="${pkgdir}" install
}
