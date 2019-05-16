# Maintainer: Pradana Aumars <paumars@protonmail.com>

pkgname=classicladder
pkgver=0.9
pkgrel=112
epoch=
pkgdesc="An open source project to have a free ladder and sequential (grafcet) programming software coded in C language (to be used for educational, training, in Software PLC on PC computers or embedded platforms, ...)"
arch=('x86_64')
url="https://sourceforge.net/projects/classicladder/"
license=('LGPL3')
groups=()
depends=()
makedepends=(pkgconf gtk2)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver.$pkgrel.tar.gz/download")
noextract=()
sha512sums=("c6b2fcf8fdc6557ea845286dcdc08d18c64746ee156785893969417ea14fa2b8d52c86d998ca8c6f6c843dca55ec53f96e8668a6aeac76d80699ddf4c1f456bc")
validpgpkeys=()

build() {
	cd "$pkgname"/src
	make
}

package() {
	cd "$pkgname"
	install -D -m755 $pkgname "${pkgdir}/usr/bin/$pkgname"
}
