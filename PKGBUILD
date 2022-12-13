# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <hexisXz https://github.com/hexisXz>
pkgname=hexpmg
pkgver=1.13
pkgrel=1
epoch=
pkgdesc="a simple package manager that builds programs from source"
arch=(x86_64 i686)
url="https://github.com/hexisXz/hexpmg.git"
license=('GPL')
groups=()
depends=()
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

pkgver() {
	cd "${_pkgname}"
	printf "1.13.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd hexpmg
	chmod +x install && ./install

}
