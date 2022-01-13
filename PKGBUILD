# Maintainer: Brett Lee (ItzAfroBoy) <me.caramackid@gmail.com>
pkgname=lst
pkgver=1.1.0
pkgrel=1
pkgdesc="A shitty file manager written in C99"
arch=('x86_64')
url="https://github.com/ItzAfroBoy/lst"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
depends=('txt' 'glibc')
sha256sums=('a4e9d9a9cd429c976a66535de4b26b5910b1cedff17f7c3bc40e390d928138eb')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
}
