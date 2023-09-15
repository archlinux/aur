# Maintainer: lucas <lucas.mior.2@gmail.com>

pkgbase=brn2
pkgname=brn2
pkgver=0.4
pkgrel=2
pkgdesc="fast bulk renamer with swapping"
arch=(x86_64)
url='https://github.com/lucas-mior/brn2'
license=(AGPL)
depends=()
optdepends=()
makedepends=(git)
provides=(brn2)
conflicts=(brn2)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

build() {
	cd brn2
	make
}

package() {
	cd brn2
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
