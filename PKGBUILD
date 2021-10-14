# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=vct
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="a vocabulary trainer written in rust"
arch=('any')
license=("MIT")
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
source=("https://gitlab.sokoll.com/moritz/vct/-/archive/e7cf281af88498f13377d0b870194405a534ff41/vct-e7cf281af88498f13377d0b870194405a534ff41.tar.gz")
noextract=()
sha256sums=("943d30315f5db578656b8513ce9ca39e8e70ef2b68d973c9828bf1a202b3acd4")
validpgpkeys=()

build() {
	cd 'vct-e7cf281af88498f13377d0b870194405a534ff41'
	./configure.sh -p "$pkgdir/usr"
	make
}

#check() {
#	cd gimgview-master
#	make -k check
#}

package() {
	cd 'vct-e7cf281af88498f13377d0b870194405a534ff41'
	mkdir -p "$pkgdir"/usr/bin
	make install
}
