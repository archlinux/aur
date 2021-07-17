# Maintainer: nezbednik <nezbedniklmao@gmail.com>
pkgname=tiny
pkgver=1.0
pkgrel=1
pkgdesc="An eentsy-teensy turing-complete programming language that isn't a brainfuck to code in ;)"
arch=("any")
url="https://github.com/YaBoiMason/tiny"
license=("MIT")
depends=("python3")
source=("https://github.com/YaBoiMason/tiny/archive/refs/tags/v1.0.zip")
sha256sums=("233c07eece46577d5c1f22cb892745f4e772eeecd59912674fa3de4bcf85c0ff")

package() {
	cd tiny-$pkgver
	mkdir -p $pkgdir/usr/bin
	install -m775 tiny.py $pkgdir/usr/bin/tiny
}
