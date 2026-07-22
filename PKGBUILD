# Maintainer: Andrii Berezhynskyi <microsolutions_harebrain@aleeas.com>
pkgname=scrolex-bin
pkgver=0.6.0
pkgrel=1
pkgfullname=scrolex-$pkgver-x86_64-unknown-linux-gnu
pkgdesc="A Horizontally Scrolled PDF Viewer"
arch=('x86_64')
license=('MIT')
url="https://github.com/molecule-man/scrolex"
depends=('gtk4' 'poppler')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgfullname.tar.gz")
sha256sums=('c24c526977ace2b00567c6c67ebc00cfbe2823d52757301a677b62dd70061c57')

package() {
	cd "$srcdir/$pkgfullname"

	install -Dm755 "scrolex" "$pkgdir/usr/bin/scrolex"
	install -Dm644 "resources/scrolex.desktop" "$pkgdir/usr/share/applications/scrolex.desktop"
	install -Dm644 "resources/icon.png" "$pkgdir/usr/share/icons/scrolex.png"
}
