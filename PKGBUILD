# Maintainer: JaydenDev <jdev0894@gmail.com>

pkgname=vimirror
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple utility to change, test, and use mirrors"
arch=('any')
url="https://github.com/JaydenDev/$pkgname"
license=('MIT')
provides=("$pkgname")
source=("https://dl.jaydendev.repl.co/vimirror-1.0.0.tar.gz")
md5sums=("223a8a9a1da0b5bc2acc2ebebd2e1f62")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/main.sh" "$pkgdir/usr/bin/vimirror"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

