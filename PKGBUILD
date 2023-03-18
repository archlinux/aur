# Maintainer: flippantwalrus <aur at hexoasm dot net>

pkgname=nabud-git
pkgver=v1.2.1
pkgrel=1
epoch=
pkgdesc="A server for the NABU PC"
arch=('x86_64')
url="https://github.com/thorpej/nabud"
license=('BSD')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

#prepare() {
#}

build() {
	cd "${srcdir}/${pkgname}"
	./configure --prefix="${pkgdir}"
	make
}

#check() {
#}

package() {
	cd "${srcdir}/${pkgname}"
	make install
}
