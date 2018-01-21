# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=epub-tools
pkgver=2.11
pkgrel=1
pkgdesc='Command line utilities for working with epub files'
arch=('x86_64')
url='https://github.com/dino-/epub-tools'
license=('BSD3')
depends=('gmp' 'zlib')
makedepends=()
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-linux.tar.gz")

sha256sums=('6e61c5655ea64892315ef282125eb63a7ec31bccff077cef815ffe0e03adde6d')


# PKGBUILD functions

package() {
   cd ${srcdir}/${pkgname}-${pkgver}
   mkdir "${pkgdir}/usr"
   cp -r * "${pkgdir}/usr"
}
