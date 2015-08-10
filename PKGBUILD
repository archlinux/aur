# Author: Patrick Brisbin <pbrisbin@gmail.com>
pkgname=aurget
pkgver=4.6.0
pkgrel=1
pkgdesc="A simple, Pacman-like AUR helper"
arch=('any')
url="https://github.com/pbrisbin/$pkgname"
license=('GPL')
source=("https://github.com/pbrisbin/$pkgname/archive/v$pkgver.tar.gz")
optdepends=('customizepkg: for auto-customizing packages')

package() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" install
}
md5sums=('265408d7f39fb502bae24d67fabf68a2')
