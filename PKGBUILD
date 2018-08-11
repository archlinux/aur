# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn
pkgver=1.9
pkgrel=1
pkgdesc="The fastest terminal file manager ever written."
arch=("i686" "x86_64")
depends=("ncurses" "readline")
makedepends=("pkgconf")
url="https://github.com/jarun/nnn"
license=('CUSTOM')
source=("https://github.com/jarun/nnn/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('7ba298a55a579640fe0ae37f553be739957da0c826f532beac46acfb56e2d726')

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
