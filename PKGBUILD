# Maintainer: Andrii Berezhynskyi <microsolutions_harebrain@aleeas.com>
pkgname=scrolex-bin
pkgver=0.3.2
pkgrel=1
pkgfullname=scrolex-$pkgver-x86_64-unknown-linux-gnu
pkgdesc="A Horizontally Scrolled PDF Viewer"
arch=('x86_64')
license=('MIT')
url="https://github.com/molecule-man/scrolex"
depends=('gtk4' 'poppler')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgfullname.tar.gz")
sha256sums=('5833d9c8bcace0476ad82d3379ae0e0b3b41958ca3f821590b4d59965f3a0c33')

package() {
	cd "$srcdir/$pkgfullname"

	install -Dm755 "scrolex" "$pkgdir/usr/bin/scrolex"
	install -Dm644 "resources/scrolex.desktop" "$pkgdir/usr/share/applications/scrolex.desktop"
	install -Dm644 "resources/icon.png" "$pkgdir/usr/share/icons/scrolex.png"
}
