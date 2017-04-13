# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn
pkgver=1.0
pkgrel=1
pkgdesc="Free, fast, friendly file browser"
arch=("i386" "x86_64")
url="https://github.com/jarun/nnn"
license=('GPL3')
source=("https://github.com/jarun/nnn/archive/v${pkgver//_/-}.tar.gz")
md5sums=('b996d7db301d62fdb9610f058efa9f99')

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
