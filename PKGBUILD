# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn
pkgver=1.6
pkgrel=1
pkgdesc="The missing terminal file browser for X."
arch=("i686" "x86_64")
depends=("ncurses" "readline")
url="https://github.com/jarun/nnn"
license=('CUSTOM')
source=("https://github.com/jarun/nnn/archive/v${pkgver//_/-}.tar.gz")
md5sums=('3040d88a3eebb93cb27b1376d490805d')


package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
