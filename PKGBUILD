# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh-bin
pkgver=1.3.3
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
sha512sums=('3bc10de8ab252214892c0cf22545dab9a6c613a32ec59f531eaff2ea32e53447b2404d14a7af361968edec27314e69a8aeb7b65f312cf503992b62420c4e4339')
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
