pkgname=unibilium
pkgver=1.1.4
pkgrel=1
pkgdesc="a terminfo parsing library"
arch=('x86_64' 'i686')
url="https://github.com/mauke/unibilium/"
license=('LGPLv3')
depends=()
source=("https://github.com/mauke/unibilium/archive/v$pkgver.tar.gz")

build() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr
}

package() {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" make install PREFIX=/usr
}
md5sums=('89c1e26f846b394065dd1287ef07b07a')
