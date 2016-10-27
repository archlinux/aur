# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=epub-tools
pkgver=2.9
pkgrel=2
pkgdesc='Command line utilities for working with epub files'
arch=('i686' 'x86_64')
url='http://hub.darcs.net/dino/epub-tools'
license=('BSD3')
depends=('gmp' 'libffi' 'zlib')
makedepends=('ghc' 'stack')
source=("http://hackage.haskell.org/package/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('eb550fbc268852c3e3c29eab32c9c2d171b5b1326f5e9676f42d4802dafb0ea5')


# PKGBUILD functions

package() {
   cd ${srcdir}/${pkgname}-${pkgver}

   stack runghc -- ./util/install.hs --prefix=${pkgdir}/usr
}
