
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=shfm
pkgver=0.4.2
pkgrel=2
pkgdesc='file manager written in posix shell.'
arch=('any')
url='https://github.com/dylanaraps/shfm'
license=('MIT')
provides=('shfm')
conflicts=('shfm-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dylanaraps/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('3861d1130cefbeef4306da686997143c95386c6b5a229472b11053a2da0ddfe4')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 shfm -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname"
}
