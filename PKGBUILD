# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=etckeeper-packages
pkgver=0.1.0
pkgrel=2
pkgdesc='Track installed packages in etckeeper (alternative to pug and pacmanity)'
url="https://github.com/alerque/$pkgname"
arch=('any')
license=('GPL3')
depends=('pacman' 'etckeeper')
source=("$pkgname-pkgver.tar.gz::https://github.com/alerque/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bacabc2d09b1c8b0d984c5e1537d77f4c5017005c4c7ef23f2a14bad122fb1b9')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
