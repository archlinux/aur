# Maintainer: Cyan903 <cyanp0515 at gmail dot com>

pkgname="quatracker-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc="A score tracker for the rhythm game Quaver."
arch=("x86_64")
url="https://github.com/Cyan903/Quatracker"
license=("MIT")
depends=("webkit2gtk")
provides=("quatracker")
conflicts=("quatracker")
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/quatracker-$pkgver-amd64.tar.gz")
sha256sums=("e2a9c9cb7ea5ba85b4a27fb704770b17cfde87e85f72b8ce0bb1f7ad1d62c2cd")

package() {
	install -Dm755 "./quatracker" "$pkgdir/usr/bin/quatracker"
	install -Dm644 "./README.md" "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "./quatracker.desktop" "$pkgdir/usr/share/applications/quatracker.desktop"
	install -Dm644 "./quatracker.png" "$pkgdir/usr/share/pixmaps/quatracker.png"
}
