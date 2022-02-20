# Maintainer: Brett Lee (ItzAfroBoy) <me.caramackid@gmail.com>
pkgname=lst
pkgver=1.1.1
pkgrel=1
pkgdesc="A shitty file manager written in C99"
arch=('x86_64')
url="https://github.com/ItzAfroBoy/lst"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
depends=('txt' 'glibc')
sha256sums=('113c1bdcb253772ae5b46bbbcf75142bfa554a3c58ec7f82995982f3f6d8ccd8')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
}
