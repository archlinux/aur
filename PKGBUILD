Maintainer="baris-inandi"
pkgname=fe
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="AUR helper with a familiar subcommand system"
arch=(x86_64)
url="https://github.com/baris-inandi/fe"
license=('GPLv3')
groups=()
depends=(bash sudo)
makedepends=(git go)
checkdepends=()
optdepends=()
provides=(fe)
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

package() {
	cd $pkgname
	make install
}
