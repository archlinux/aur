# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Abdelhakim Qbaich <abdelhakim@qbaich.com>

pkgname=pash
pkgver=2.3.0
pkgrel=3
pkgdesc='Simple password manager using GPG written in POSIX sh'
arch=('any')
url="https://github.com/dylanaraps/pash"
license=('MIT')
depends=('gnupg')
optdepends=(
	'xclip: clipboard support'
	'tree: listing entries in a tree')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7ee6a649d80350b8b52b1b7ad78d687775a3cc145fecbd3a75d34865c31dd7ef')

package() {
	cd "$pkgname-$pkgver"
	install -D "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
