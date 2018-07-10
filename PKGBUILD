# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh-bin
pkgver=1.2.3
pkgrel=1
#epoch=
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64')
url='https://www.brow.sh'
license=('GPL-3.0')
#groups=()
depends=('firefox>=57')
#makedepends=()
#checkdepends=()
#optdepends=()
provides=('browsh')
conflicts=('browsh' 'browsh-git')
#replaces=()
#backup=()
options=('!strip')
#install=
#changelog=
source=("https://github.com/browsh-org/browsh/releases/download/v${pkgver}/browsh_${pkgver}_linux_amd64")
#noextract=()
sha512sums=('285c3e9c3c1192f6af12f1ff60798defd5ff51e6f10552798c03af65702bd1d44bc3902c0582281435a1d3100907e82fbc6a68848a5939d46f4b2b60ac5b4318')
#validpgpkeys=()

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
	install -Dm755 browsh_${pkgver}_linux_amd64 $pkgdir/usr/bin/browsh
}
