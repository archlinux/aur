# Maintainer: JaydenDev <jdev0894@gmail.com>

pkgname=vimirror
pkgver=1.0.2
pkgrel=2
pkgdesc="A simple utility to change, test, and use mirrors"
arch=('any')
url="https://github.com/JaydenDev/$pkgname"
license=('MIT')
provides=("$pkgname")
source=("https://github.com/JaydenDev/vimirror/archive/refs/tags/v1.0.2.tar.gz")
md5sums=("SKIP")
depends=('vim')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/main.sh" "$pkgdir/usr/bin/vimirror"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.1" "$pkgdir/usr/share/man/man1/vimirror.1"
}

