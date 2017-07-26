# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn
pkgver=1.3
pkgrel=1
pkgdesc="Free, fast, friendly file browser"
arch=("i686" "x86_64")
depends=("ncurses" "readline")
url="https://github.com/jarun/nnn"
license=('CUSTOM')
source=("https://github.com/jarun/nnn/archive/v${pkgver//_/-}.tar.gz")
md5sums=('ee8830d3259c1270e3dfd11f3853fd91')


package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
