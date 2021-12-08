# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
pkgname=ibus-table-others
pkgver=1.3.12
pkgrel=0
pkgdesc="Provides many ibus-table based keyboards, including emoji and IPA/X-SAMPA"
arch=('i686' 'x86_64')
depends=('ibus-table')
url="https://github.com/moebiuscurve/ibus-table-others"
license=('GNU')
source=("https://github.com/moebiuscurve/ibus-table-others/releases/download/1.3.12/ibus-table-others-1.3.12.tar.gz")
noextract=()
options=()
md5sums=('0046d812a54f92b8fb547f89d6594a88')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

