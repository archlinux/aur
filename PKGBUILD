# Maintainer: Your Name <your@email.com>
pkgname=beer
pkgver=1.0.0
pkgrel=1
pkgdesc="Print beer ASCII art in your terminal"
arch=('any')
url="https://github.com/bailuocf/beer"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b6e2b6952457194e27d9fdccdde35c8f5e59d15c644293274ae54d40d45c1822')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 beer.py "$pkgdir/usr/bin/beer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
