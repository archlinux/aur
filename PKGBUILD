# Maintainer: Your Name <youremail@domain.com>
_pkgname=datadraw
pkgname=datadraw-git
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc='DataDraw is a database generator.'
arch=('any')
url='https://github.com/waywardgeek/datadraw'
license=('LGPL')
sha256sums=('SKIP')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=('datadraw')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${srcdir}/$_pkgname::git+https://github.com/waywardgeek/datadraw.git")
noextract=()
validpgpkeys=()

build() {
	cd "$srcdir/$_pkgname"
    ./autogen.sh
    ./configure --prefix="$pkgdir/usr"
    make
}


package() {
	cd "$srcdir/$_pkgname"
    make install
}
