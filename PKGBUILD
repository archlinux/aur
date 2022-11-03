# Maintainer: james <james at jamesnorth dot net>
pkgname=mkshousetsu
pkgver=v0.2.0
pkgrel=1
pkgdesc="Generates EPUBs for ncode.syosetu.com novels"
arch=('any')
url="https://git.sr.ht/~jamnor/$pkgname"
license=('GPL3')
depends=('python-requests' 'python-lxml')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~jamnor/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('d1e9e9899a70bbada40828bc1c5c2d1701a102bee0ded151fa45e645e30aa893')

package() {
    tar -xzf "$pkgname-$pkgver.tar.gz"
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 mkshousetsu.py "$pkgdir"/usr/bin/mkshousetsu
}
