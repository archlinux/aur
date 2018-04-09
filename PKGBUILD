# Maintainer 2016-2018: Yadav Gowda <yadav . gowda __at__ gmail . com>
# Maintainer 2018-now : Vitrum <wqdxosty1yhj at bk dot ru>

pkgname=libkmfl
pkgver=0.9.12
pkgrel=1
pkgdesc="Keyboard Mapping for Linux (KMFL) runtime library"
arch=('i686' 'x86_64')
url="http://kmfl.sourceforge.net/"
license=('GPL')
source=("https://sourceforge.net/projects/kmfl/files/kmfl/libkmfl/libkmfl-$pkgver.tar.gz")
depends=('kmflcomp')
noextract=()
options=()
md5sums=('e70f845e1a29beab30e1328209d4eb34')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
