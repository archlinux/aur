# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn
pkgver=1.0
pkgrel=2
pkgdesc="Free, fast, friendly file browser"
arch=("i386" "x86_64")
depends=("ncurses")
url="https://github.com/jarun/nnn"
license=('GPL3')
source=("https://github.com/jarun/nnn/archive/v${pkgver//_/-}.tar.gz")
md5sums=('9434e449f284c418039fbd82270a1e83')

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
