# Maintainer: Timothy "Chuck" Flowers <t_chuck_flowers@yahoo.com>
_pkgname=bosq
pkgname=$_pkgname-git
pkgver=0.0.1
pkgrel=1
epoch=1
pkgdesc="A utility for creating tree visualizations from a list of delimited strings"
arch=(any)
url="https://github.com/chuck-flowers/bosq"
license=('unknown')
groups=()
depends=()
makedepends=(
	'git'
	'pandoc-cli'
)
checkdepends=()
optdepends=()
provides=(
	'bosq'
)
source=("git+https://github.com/chuck-flowers/bosq")
md5sums=(SKIP)

build() {
	cd "$_pkgname"
	make all
}

package() {
	cd "$_pkgname"
	make PREFIX="$pkgdir/usr" install
}

