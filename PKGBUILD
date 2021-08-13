# Maintainer: Brian Polier <unknown989@protonmail.com>
pkgname=iv-git
pkgver=1
pkgrel=1
pkgdesc="A simple yet powerful image viewer"
arch=('any')
url="https://github.com/unknown989/iv.git"
license=('GPL')
groups=()
depends=(sfml zenity)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd iv
	make
}

package() {
	cd iv
	make install
}
