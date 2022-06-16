# Maintainer: Luc <luc@dougy147.com>
pkgname=mcbash
pkgver=0.1.r83.5e53d01
pkgrel=1
epoch=
pkgdesc="scan for valid MAC addresses on Stalker Portal servers"
arch=(x86_64 i686)
url="https://github.com/dougy147/mcbash.git"
license=('GPL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(mcbash)
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
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd mcbash
	make PREFIX=/usr/local DESTDIR="${pkgdir}" install
}
