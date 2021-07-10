# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Brahma Sharma <brahmasharma@protonmail.com>
pkgname=blang-git
pkgver=trunk
pkgrel=1
epoch=
pkgdesc="An AUR port for the blang programming language."
arch=("any")
url="https://github.com/blang-pl/blang.git"
license=('MIT')
groups=()
depends=()
makedepends=(crystal shards)
checkdepends=()
optdepends=()
provides=(blang)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd blang
	make
}

package() {
	cd blang
	sudo make install
}
