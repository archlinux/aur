# Maintainer: james <software AT vncompat DOT org>
pkgname=mkshousetsu
pkgver=0.2.5
pkgrel=1
pkgdesc="Generates EPUBs for ncode.syosetu.com novels"
arch=('any')
url="https://git.sr.ht/~jamnor/$pkgname"
license=('GPL3')
depends=('python-requests' 'python-lxml')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~jamnor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('662695174c7e319fd9c3447840dabad912a076dbd8eca7c3f065f2fa425d9ef5')

package() {
    tar -xzf "$pkgname-$pkgver.tar.gz"
    cd "$srcdir/$pkgname-v$pkgver"
    install -Dm755 mkshousetsu.py "$pkgdir"/usr/bin/mkshousetsu
}
