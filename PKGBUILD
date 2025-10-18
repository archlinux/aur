# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
pkgname=ibus-table-others
pkgver=1.3.21
pkgrel=0
pkgdesc="Provides many ibus-table based keyboards, including emoji and IPA/X-SAMPA"
arch=('i686' 'x86_64')
depends=('ibus-table')
url="https://github.com/moebiuscurve/ibus-table-others"
license=('GNU')
source=("https://github.com/moebiuscurve/ibus-table-others/releases/download/${pkgver}/ibus-table-others-${pkgver}.tar.gz")
noextract=()
options=()
md5sums=('2873ac6420acd49136cdad726bd648a0')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

