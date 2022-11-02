# Maintainer: james <james at jamesnorth dot net>
pkgname=mkshousetsu
pkgver=v0.1.0
pkgrel=1
pkgdesc="Scrapes syosetu.com novels and generates an EPUB"
arch=('any')
url="https://git.sr.ht/~jamnor/$pkgname"
license=('GPL3')
depends=('python-requests' 'python-lxml')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~jamnor/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('190961c26bfb594c6f1a66a4b3e694c1fa9405aa63f136f54efcb6c9b85aa6f2')

package() {
    tar -xzf "$pkgname-$pkgver.tar.gz"
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 mkshousetsu.py "$pkgdir"/usr/bin/mkshousetsu
}
