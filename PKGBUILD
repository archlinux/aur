pkgname=hi
pkgver=1.0
pkgrel=1
pkgdesc="Prints 'hello' and exits"
arch=('any')
license=('MIT')
source=('hi.sh')
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/hi.sh" "$pkgdir/usr/bin/hi"
}
