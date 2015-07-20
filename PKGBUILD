pkgname=unibilium
pkgver=1.1.5
pkgrel=1
pkgdesc="a terminfo parsing library"
arch=('x86_64' 'i686')
url="https://github.com/mauke/unibilium/"
license=('LGPLv3')
depends=()
source=("https://github.com/mauke/unibilium/archive/v$pkgver.tar.gz")
md5sums=('3cd508847eab55c4aa8466e9ff1e7080')

build() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr
}

package() {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" make install PREFIX=/usr
}
