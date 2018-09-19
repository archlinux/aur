# Maintainer: Matthijs Tadema <M dot J dot Tadema at gmail dot com>
# Co-Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>
pkgname=python2-insane
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Tool for constructing MARTINI coarse grained lipid bilayers in python"
arch=("any")
url="https://github.com/Tsjerk/Insane"
license=('GPL2')
depends=("python2" "python2-pip")
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
source=()
noextract=()
md5sums=()
validpgpkeys=()

#prepare() {
#}
#build() {
#}
#
#check() {
#}

package() {
	pip2 install --install-option="--prefix=$pkgdir/usr/" insane
}

