# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=libbtui
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="library for simple text based user interfaces"
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
source=("https://gitlab.sokoll.com/moritz/btui-c/-/archive/main/btui-c-main.tar.gz")
noextract=()
sha256sums=("1379f36a40823afa278f7917aca947853175db422b5c2b921bc86077c5e751c7")
validpgpkeys=()

build() {
	cd btui-c-main
	./configure -L -p "$pkgdir/usr"
	make
}

#check() {
#	cd gimgview-master
#	make -k check
#}

package() {
	cd btui-c-main
	make install
}
