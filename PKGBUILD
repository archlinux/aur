# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>  
pkgname=sl-alt
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Mirror the output of ls"
arch=('any')
url="https://gir.st/blog/sl-alt.htm"
license=('GPL3')
groups=()
depends=('bash')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('sl')
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
sha512sums=()
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#build() {
#	cd "$pkgname-$pkgver"
#	./configure --prefix=/usr
#	make
#}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
#	cd "$pkgname-$pkgver"
	install -dm755 "$pkgdir"/usr/bin/
	install -m755  "$startdir"/sl "$pkgdir"/usr/bin
}
