# Maintainer: Andrii Berezhynskyi <microsolutions_harebrain@aleeas.com>
pkgname=scrolex-bin
pkgver=0.2.0
pkgrel=1
pkgfullname=scrolex-$pkgver-x86_64-unknown-linux-gnu
pkgdesc="A Horizontally Scrolled PDF Viewer"
arch=('x86_64')
license=('MIT')
url="https://github.com/molecule-man/scrolex"
depends=('gtk4' 'poppler')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgfullname.tar.gz")
sha256sums=('89f30b9c3790fff7ce8a43d182b2d937f59fbec7a3b12fbb8be0bb71c85f85af')

package() {
	cd "$srcdir/$pkgfullname"

	install -Dm755 "scrolex" "$pkgdir/usr/bin/scrolex"
	install -Dm644 "resources/scrolex.desktop" "$pkgdir/usr/share/applications/scrolex.desktop"
	install -Dm644 "resources/icon.png" "$pkgdir/usr/share/icons/scrolex.png"
}
