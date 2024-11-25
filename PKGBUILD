# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI util to list recently installed packages with filtering."
arch=('any')
url="https://github.com/zweih/yaylog"
license=('MIT')
depends=('expac')
source=("$pkgname.sh" "$pkgname.1")
sha256sums=('80706d8a4aff84f716729cbe48da892995bf757e6b77f1c9d682aac542fb2149' '7fedc1f3bcfab09acedbe9d4b508c6ecb6619ed197dd702f4c3d987fec34d197')

package() {
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
