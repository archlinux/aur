# Maintainer: Mio Nekoya <mio9 at tabbybox.art>
pkgname=serve-bin
pkgver=0.2.0
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
source=("serve-$pkgver-$pkgrel::https://github.com/tabbybox/serve/releases/download/v0.2.0/serve-linux-amd64")
noextract=()
sha256sums=("e8fdee5f5c16bffd339a6677c024022d527f1d695ee7ed6bf31784c22cf9797f")
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
