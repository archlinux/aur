# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=vct
pkgver=1.2.2
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
source=("https://gitlab.sokoll.com/moritz/vct/-/archive/6f2fedec950c8631e2b5c96208099e0a77a366fb/vct-6f2fedec950c8631e2b5c96208099e0a77a366fb.tar.gz")
noextract=()
sha256sums=("66b83379924a924a1676046ef41be36aa551d63094a8479694d5017aeeaea267")
validpgpkeys=()

build() {
	cd 'vct-6f2fedec950c8631e2b5c96208099e0a77a366fb'
	./configure.sh -p "$pkgdir/usr"
	make
}

#check() {
#	cd gimgview-master
#	make -k check
#}

package() {
	cd 'vct-6f2fedec950c8631e2b5c96208099e0a77a366fb'
	mkdir -p "$pkgdir"/usr/bin
	make install
}
