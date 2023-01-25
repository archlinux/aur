# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Vincent Bidard de la Noë <vincentbidarddelanoe@gmail.com>
pkgname="aurh-git"
pkgver="0.2"
pkgrel=1
pkgdesc="An AUR Helper"
arch=('any')
url="https://github.com/Vinz2008/Aurh"
license=('GPL')
makedepends=("git")
depends=("curl")
sha256sums=('SKIP')
install=
changelog=
source=("aurh::git+https://github.com/vinz2008/Aurh.git")
noextract=()


build() {
	echo ${srcdir}
	cd ${srcdir}/aurh
	make
}


package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/aurh/aurh" "${pkgdir}/usr/bin/aurh"
	chmod a+x "${pkgdir}/usr/bin/aurh"
}
