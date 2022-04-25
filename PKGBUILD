pkgname=rchat
pkgver=0.4
pkgrel=1
pkgdesc="rautafarmi chat client with Vim keybinds written in Bash"
arch=("any")
url="https://github.com/speediegamer/rchat"
license=("GPL3")
depends=("bash" "sed")
source=("https://github.com/speediegamer/rchat/archive/refs/tags/$pkgver-r$pkgrel.tar.gz")
sha256sums=("3dd0e00304f90c877bc9ae3432df1781704e72036dd753d6934c17baa5cd135d")

package() {
	mkdir -p "$pkgdir/usr/bin"
	cd "rchat-$pkgver-r$pkgrel"
	cp "rchat" "$pkgdir/usr/bin"
	chmod 755 "$pkgdir/usr/bin/rchat"
}
