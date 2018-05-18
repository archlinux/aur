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
sha256sums=('03a812d859bb133af7acd3246d973de3d4a7388d346ff2290df1e86e7d4bc382')
build() {
  cd "${srcdir}/aspell-bn-master"

  ./configure
  make
}

package() {
  cd "${srcdir}/aspell-bn-master"

  make DESTDIR="${pkgdir}" install
}
