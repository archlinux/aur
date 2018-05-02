# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn
pkgver=1.8
pkgrel=1
pkgdesc="The missing terminal file browser for X."
arch=("i686" "x86_64")
depends=("ncurses" "readline")
url="https://github.com/jarun/nnn"
license=('CUSTOM')
source=("https://github.com/jarun/nnn/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('65c364a9797178e40ec7ec653b2cfa8e211e556b75250bf72eb5eea57f5e0cdc')

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
