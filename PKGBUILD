# Maintainer: james <james at jamesnorth dot net>
pkgname=mkshousetsu
pkgver=v0.2.2
pkgrel=1
pkgdesc="Generates EPUBs for ncode.syosetu.com novels"
arch=('any')
url="https://git.sr.ht/~jamnor/$pkgname"
license=('GPL3')
depends=('python-requests' 'python-lxml')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~jamnor/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b1a59b3aed9a7cdc873213f554b2ea6c627e240e1b01166cea63148fc3b326ea')

package() {
    tar -xzf "$pkgname-$pkgver.tar.gz"
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 mkshousetsu.py "$pkgdir"/usr/bin/mkshousetsu
}
