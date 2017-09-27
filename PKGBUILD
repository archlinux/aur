# Maintainer: Pavel Sayekat; mail to <pavelsayekat@gmail.com>

pkgname=aspell-bn
pkgver=0.02
pkgrel=1
pkgdesc="Bengali spellcheck dictionary for aspell"
arch=('i686' 'x86_64')
url="http://aspell.net/"	
license=('GPL2')
depends=('aspell')
source=("https://github.com/Pavel-Sayekat/aspell-bn/archive/master.zip")
sha256sums=('e1e16c11d651863ec1c1273e60417aaaa5f88a4905565e7bf2a17cbec0b5c247')
build() {
  cd "${srcdir}/aspell-bn-master"

  ./configure
  make
}

package() {
  cd "${srcdir}/aspell-bn-master"

  make DESTDIR="${pkgdir}" install
}
