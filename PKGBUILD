# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=photoname
pkgver=3.2
pkgrel=2
pkgdesc='Rename JPEG photo files based on shoot date'
arch=('i686' 'x86_64')
url="http://hub.darcs.net/dino/photoname"
license=('BSD3')
depends=('gmp' 'libexif' 'libffi')
makedepends=('ghc' 'stack')
source=("http://hackage.haskell.org/package/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('6a4ee3e631d005b6904444d025ec1ccd9aa4dd0e841f4068806567998e86fcf9')


# PKGBUILD functions

package() {
   cd ${srcdir}/${pkgname}-${pkgver}

   stack runghc -- ./util/install.hs --prefix=${pkgdir}/usr
}
