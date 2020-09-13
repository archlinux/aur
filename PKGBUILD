# Maintainer: Yujeonja <hardboiled65@gmail.com>
pkgname=httproto
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="HTTP protocol library."
arch=('x86_64')
url="https://github.com/hardboiled65/httproto"
license=('MIT')
groups=()
depends=('http-parser>=2.9.4')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/hardboiled65/httproto/archive/v0.1.0.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$pkgname-$pkgver"
	DEBUG=0 make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('4231bb1ce7a35a67149a9adf1793f212')
