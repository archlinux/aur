# Maintainer: Andrii Berezhynskyi <microsolutions_harebrain@aleeas.com>
pkgname=scrolex-bin
pkgver=0.2.1
pkgrel=1
pkgfullname=scrolex-$pkgver-x86_64-unknown-linux-gnu
pkgdesc="A Horizontally Scrolled PDF Viewer"
arch=('x86_64')
license=('MIT')
url="https://github.com/molecule-man/scrolex"
depends=('gtk4' 'poppler')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgfullname.tar.gz")
sha256sums=('b5a720abddeaf376658b1157b9cfe30867dfe1a73a4865b766933f5e79b9e71f')

package() {
	cd "$srcdir/$pkgfullname"

	install -Dm755 "scrolex" "$pkgdir/usr/bin/scrolex"
	install -Dm644 "resources/scrolex.desktop" "$pkgdir/usr/share/applications/scrolex.desktop"
	install -Dm644 "resources/icon.png" "$pkgdir/usr/share/icons/scrolex.png"
}
