# Maintainer: Kacper Wróżek <kacperek18210@gmail.com>
pkgname=calc-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple, clean CLI calculator"
arch=('any')
url="https://github.com/FlippantList428/calc-cli"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "calc.py" "$pkgdir/usr/bin/calc"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}