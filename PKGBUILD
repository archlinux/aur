# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=jj-bin
_pkgname=jj
pkgver=1.2.3
pkgrel=1
pkgdesc="JSON Stream Editor"
arch=('x86_64')
license=('MIT')
url="https://github.com/tidwall/jj"
source=(https://github.com/tidwall/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz)
sha256sums=('ea05a4e1373f5c8cdf66f11c30215ce1441b2ca9c128f5e0ee23338aad4937a7')

package() {
    cd "$srcdir/$_pkgname-$pkgver-linux-amd64"

	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
