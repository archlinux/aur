# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=sambamba
pkgver=0.6.6
pkgrel=1
pkgdesc="Tools for working with SAM/BAM data"
arch=('i686' 'x86_64')
url="http://lomereiter.github.io/sambamba"
license=('GPL2')
depends=('')
source=(https://github.com/lomereiter/sambamba/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux.tar.bz2)
sha1sums=('d64b1b6862117374ab53d3099439b1968c5a0043')

package() {
    cd "${srcdir}"
    install -Dm755 ${pkgname}_v${pkgver} "${pkgdir}/usr/bin/${pkgname}"
}
