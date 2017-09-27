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
sha256sums=('1e774ffdc728def394fd11aefaa3b1f8128998e1ab54897e7fd3d622ab9a3cf80304f811c5ed73abe953cdb6eace9b847a713de2ffc9a883fc6546b528dd5eb4')
build() {
  cd "${srcdir}/aspell6-bn-${pkgver}"

  ./configure
  make
}

package() {
  cd "${srcdir}/aspell6-bn-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
