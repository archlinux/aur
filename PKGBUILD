# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=0.2
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/src/"
license=('BSD')
depends=('python2' 'rcs')
source=("$url$pkgname-$pkgver.tar.gz")
sha256sums=('d4c47fc70bfae5da3266d0cf74d7b01de4796365f463657621371df6ec1a2e54')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 src "$pkgdir/usr/bin/src"
  install -Dm644 src.1 "$pkgdir/usr/share/man/man1/src.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
