# Maintainer: Timothy "Chuck" Flowers <t_chuck_flowers@yahoo.com>
_pkgname=bosq
pkgname=$_pkgname-git
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="A utility for creating tree visualizations from a list of delimited strings"
arch=(any)
url="https://github.com/chuck-flowers/bosq"
license=('unknown')
groups=()
depends=()
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
source=("git+https://github.com/chuck-flowers/bosq")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

build() {
	cd "$_pkgname"
	make all
}

package() {
	cd "$_pkgname"
	make PREFIX="$pkgdir/usr" install
}

