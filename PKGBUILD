# Maintainer: Mio Nekoya <mio9 at tabbybox.art>
pkgname=serve-bin
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Quickly serve static folders, minus npx"
arch=('x86_64')
url="https://github.com/tabbybox/serve"
license=('MIT')
groups=()
depends=()
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
source=("serve-$pkgver-$pkgrel::https://github.com/tabbybox/serve/releases/download/v0.1.0/serve-linux-amd64")
noextract=()
sha256sums=("10d2952a9fd974e7f474f2dc4a3cd3147d238edd289a01f6262fb3da6704376f")
validpgpkeys=()

#prepare() {
#cd "$pkgname-$pkgver"
#	echo "prepare running"
#	ls
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#build() {
#	echo "building"
#cd "$pkgname-$pkgver"

#./configure --prefix=/usr
#make
#}

#check() {
#	echo "checking"
#cd "$pkgname-$pkgver"
#make -k check
#}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mv "${srcdir}/serve-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/serve"
	chmod +x "${pkgdir}/usr/bin/serve"
	#make DESTDIR="$pkgdir/" install
}
