pkgname=rchat
pkgver=0.5
pkgrel=1
pkgdesc="rautafarmi chat client with Vim keybinds written in Bash"
arch=("any")
url="https://github.com/speediegamer/rchat"
license=("GPL3")
depends=("bash" "sed")
source=("https://github.com/speediegamer/rchat/archive/refs/tags/$pkgver-r$pkgrel.tar.gz")
sha256sums=("154d1ce80f0ee8c485c427f201bbd2d81ce79c407740658effac5ff4b6f1ac8f")

package() {
	mkdir -p "$pkgdir/usr/bin"
	cd "rchat-$pkgver-r$pkgrel"
	cp "rchat" "$pkgdir/usr/bin"
	chmod 755 "$pkgdir/usr/bin/rchat"
}
