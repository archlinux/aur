pkgname=cfetch
pkgver=1.0.1
pkgrel=1
pkgdesc="A shitty fetch written in C99"
arch=('x86_64')
url="https://github.com/ItzAfroBoy/cfetch"
license=('GPL3')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('cd2350d30efb404c96e765ea002ee9c7')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
}
