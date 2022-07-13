# Maintainer: JaydenDev <jdev0894@gmail.com>

pkgname=vimirror
pkgver=1.0.1
pkgrel=5
pkgdesc="A simple utility to change, test, and use mirrors"
arch=('any')
url="https://github.com/JaydenDev/$pkgname"
license=('MIT')
provides=("$pkgname")
source=("https://dl.jaydendev.repl.co/$pkgname-$pkgver.tar.gz")
md5sums=("e7ec5f445e88916b0bb3730b1c003ab4")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/main.sh" "$pkgdir/usr/bin/vimirror"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.1" "$pkgdir/usr/share/man/man1/vimirror.1"
}

