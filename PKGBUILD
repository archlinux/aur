# Maintainer: Scott <swlittle{VII} At gmail dot (commerical tld)>
pkgname=fetchutils-git
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A collection of small (< ~100 LOC) POSIX shell scripts to retrieve system information"
arch=("x86_64")
url="https://github.com/lptstr/fetchutils"
license=('MIT')
groups=()
depends=('bash')
makedepends=('scdoc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
BUILDENV+=('!check')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/lptstr/fetchutils.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/usr/" install
}
