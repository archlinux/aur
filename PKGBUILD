# Maintainer: james <james at jamesnorth dot net>
pkgname=mkshousetsu
pkgver=v0.2.1
pkgrel=1
pkgdesc="Generates EPUBs for ncode.syosetu.com novels"
arch=('any')
url="https://git.sr.ht/~jamnor/$pkgname"
license=('GPL3')
depends=('python-requests' 'python-lxml')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~jamnor/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('26f0a74d04dd6a7760cebe61b7ad41edb730ec6fd3565486bc4a4a03d6be5dd6')

package() {
    tar -xzf "$pkgname-$pkgver.tar.gz"
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 mkshousetsu.py "$pkgdir"/usr/bin/mkshousetsu
}
