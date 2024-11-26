# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI util to list recently installed packages with filtering."
arch=('any')
url="https://github.com/Zweih/yaylog"
license=('MIT')
depends=('expac')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zweih/yaylog/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('739061ad253320f871e35965453df73cff6c97f679841bfc2130422825c5a58f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
