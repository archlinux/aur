# Maintainer: sunchipnacho

pkgname=tbd
pkgver=2.2
pkgrel=1
pkgdesc="A command-line tool to create Text-Based Application Programming Interface (TAPI) files from existing binaries"
arch=('x86_64' 'i686' 'arm' 'aarch64')
url="https://github.com/inoahdev/tbd"
license=('MIT')
source=("https://github.com/inoahdev/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ca1da3da0388048d14d941500e47f9ead6e31933666b3455a500e11720a014f3')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	install -Dm755 "$pkgname-$pkgver"/bin/tbd "$pkgdir"/usr/bin/tbd
}
