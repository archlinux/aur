# Maintainer: Brett Lee (ItzAfroBoy) <me.caramackid@gmail.com>
pkgname=lst
pkgver=1.0.0
pkgrel=1
pkgdesc="A shitty file manager written in C99"
arch=('any')
url="https://github.com/ItzAfroBoy/lst.git"
license=('GPL3')
source=("lst.c" "lst.h" "Makefile")
md5sums=('SKIP' 'SKIP' 'SKIP')

build() {
	make
}

package() {
	install -Dm644 LICENSE "${pkdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkdir}/usr/share/doc/${pkgname}/README.md"
	make BIN="${pkgdir}/usr/bin" install
}
