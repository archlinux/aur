# Maintainer: Andrii Berezhynskyi <microsolutions_harebrain@aleeas.com>
pkgname=scrolex
pkgver=0.1.0
pkgrel=2
pkgfullver=0.1.0-alpha+2
pkgfullname=scrolex-$pkgfullver-x86_64-unknown-linux-gnu
pkgdesc="A Horizontally Scrolled PDF Viewer"
arch=('x86_64')
license=('MIT')
url="https://github.com/molecule-man/scrolex"
depends=('gtk4' 'poppler')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgfullver/$pkgfullname.tar.gz")
sha256sums=('084e0dc2d739c56d393a1230a2d3696aa0d8191a1f1ba5b90907592f6948c4a4')

package() {
	ls -R "$srcdir"
	cd "$srcdir/$pkgfullname"

	install -Dm755 "scrolex" "$pkgdir/usr/bin/scrolex"
	install -Dm644 "resources/scrolex.desktop" "$pkgdir/usr/share/applications/scrolex.desktop"
	install -Dm644 "resources/icon.png" "$pkgdir/usr/share/icons/scrolex.png"
}
