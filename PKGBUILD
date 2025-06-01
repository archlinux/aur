pkgname=estrogen
pkgver=1.0.0
pkgrel=1
pkgdesc="a silly little script that meows at you because estrogen is powerful"
arch=('any')
license=('WTFPL')
depends=('bash')
source=('estrogen')
sha256sums=('SKIP') # u can use a real hash if u wanna

package() {
  install -Dm755 "$srcdir/estrogen" "$pkgdir/usr/bin/estrogen"
}
