# Maintainer: james <software AT vncompat DOT org>
pkgname=mkshousetsu
pkgver=0.2.4
pkgrel=1
pkgdesc="Generates EPUBs for ncode.syosetu.com novels"
arch=('any')
url="https://git.sr.ht/~jamnor/$pkgname"
license=('GPL3')
depends=('python-requests' 'python-lxml')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~jamnor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5e9116548d5196284584019f627b8fb1616053d7e9237b7e93f12ba5045d2844')

package() {
    tar -xzf "$pkgname-$pkgver.tar.gz"
    cd "$srcdir/$pkgname-v$pkgver"
    install -Dm755 mkshousetsu.py "$pkgdir"/usr/bin/mkshousetsu
}
