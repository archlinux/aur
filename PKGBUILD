# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=photoname
pkgver=3.3
pkgrel=1
pkgdesc='Rename JPEG photo files based on shoot date'
arch=('x86_64')
url="https://github.com/dino-/photoname"
license=('BSD3')
depends=('gmp' 'libexif')
makedepends=()
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-linux.tar.gz")

sha256sums=('e6651cc9f3037ea5c34183a176b2199229c2f6b6023e3ebffe71d3ab6fd4bd4f')


# PKGBUILD functions

package() {
   cd ${srcdir}/${pkgname}-${pkgver}
   mkdir "${pkgdir}/usr"
   cp -r * "${pkgdir}/usr"
}
