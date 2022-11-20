# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=monocol
pkgdesc="Simple tool to generate monochromatic colorscheme for wpg"
url="https://git.sr.ht/~primalmotion/monocol"
pkgver=v1.0.0
pkgrel=1
license=(GPL3)
arch=(any)
makedepends=(go)
source=("https://git.sr.ht/~primalmotion/monocol/archive/${pkgver}.tar.gz")
sha256sums=('471b83e45874840f6bb951dba24abf25603c32795033c1380fe26cacc872978d')
provides=("monocol")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make monocol
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	PREFIX=${pkgdir}/usr make install
}
