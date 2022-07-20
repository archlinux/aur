# Maintainer: JaydenDev <jdev0894@gmail.com>

pkgname=saurh
pkgver=0.0.1
pkgrel=1
pkgdesc="simple aur helper"
arch=('any')
url="https://github.com/JaydenDev/$pkgname"
license=('MIT')
provides=("$pkgname")
source=("https://github.com/JaydenDev/saurh/archive/refs/tags/0.0.1.tar.gz")
md5sums=("SKIP")
depends=('git')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/saurh" "$pkgdir/usr/bin/saurh"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

