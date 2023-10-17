# Maintainer: james <software AT vncompat DOT org>
pkgname=mkshousetsu
pkgver=v0.2.3
pkgrel=1
pkgdesc="Generates EPUBs for ncode.syosetu.com novels"
arch=('any')
url="https://git.sr.ht/~jamnor/$pkgname"
license=('GPL3')
depends=('python-requests' 'python-lxml')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~jamnor/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('37ccb8b1a90a5ecd6c44cfb53a47ad212644fa137bce18c2c67deca0e90579e3')

package() {
    tar -xzf "$pkgname-$pkgver.tar.gz"
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 mkshousetsu.py "$pkgdir"/usr/bin/mkshousetsu
}
