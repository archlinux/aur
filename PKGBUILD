pkgname=rchat
pkgver=0.3
pkgrel=1
pkgdesc="rautafarmi chat client with Vim keybinds written in Bash"
arch=("any")
url="https://github.com/speediegamer/rchat"
license=("GPL3")
depends=("bash" "sed")
source=("https://github.com/speediegamer/rchat/archive/refs/tags/$pkgver-r$pkgrel.tar.gz")
sha256sums=("342f5a8bcb0575417f14f2c6be97e5e85c34f1ef933d5a019fe1b31c3432bd4c")

package() {
	mkdir -p "$pkgdir/usr/bin"
	cd "rchat-$pkgver-r$pkgrel"
	cp "rchat" "$pkgdir/usr/bin"
	chmod 755 "$pkgdir/usr/bin/rchat"
}
