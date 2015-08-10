# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Marcel Radzio <info@nordgedanken.de>
pkgname=radiusclient-ng
pkgver=0.5.6
pkgrel=2
epoch=
pkgdesc=""
arch=('any')
url="http://downloads.sourceforge.net/project/radiusclient-ng.berlios/radiusclient-ng-0.5.6.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fradiusclient-ng.berlios%2Ffiles%2F%3Fsource%3Dtyp_redirect&ts=1439245856&use_mirror=heanet"
license=('unknown')
groups=()
depends=('sh')
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
source=("http://downloads.sourceforge.net/project/radiusclient-ng.berlios/radiusclient-ng-0.5.6.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fradiusclient-ng.berlios%2Ffiles%2F%3Fsource%3Dtyp_redirect&ts=1439245856&use_mirror=heanet")
noextract=()
md5sums=('6fb7d4d0aefafaee7385831ac46a8e9c')
validpgpkeys=(_)
prepare() {
	mv 'radiusclient-ng-0.5.6.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fradiusclient-ng.berlios%2Ffiles%2F%3Fsource%3Dtyp_redirect&ts=1439245856&use_mirror=heanet' radiusclient-ng-0.5.6.tar.gz
	tar -zxvf radiusclient-ng-0.5.6.tar.gz
	}
build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=${pkgdir}/usr
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${pkgname}-${pkgver}"
	make install
}
