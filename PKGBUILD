# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=epub-tools
pkgver=3.1
pkgrel=1
pkgdesc='Command line utilities for working with epub files'
arch=('x86_64')
url='https://github.com/dino-/epub-tools'
license=('ISC')
depends=('gmp' 'zlib')
makedepends=()
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-linux.tar.gz")

sha256sums=('6c872d0b8455692e27a440ad422c350e60729bb0d80b0e1f2be2268d2ff9ee72')


# PKGBUILD functions

package() {
   cd ${srcdir}/${pkgname}-${pkgver}
   cp -r * "${pkgdir}"
}
