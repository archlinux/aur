# Maintainer: Brett Lee (ItzAfroBoy) <me.caramackid@gmail.com>
pkgname=lst
pkgver=1.0.0
pkgrel=3
pkgdesc="A shitty file manager written in C99"
arch=('any')
url="https://github.com/ItzAfroBoy/lst.git"
license=('GPL3')
source=("lst.c" "lst.h" "Makefile" "LICENSE" "README.md")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
	make
}

package() {
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	mkdir -p "${pkgdir}/usr/bin"
	make BIN="${pkgdir}/usr/bin" install
}
