# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=sambamba
pkgver=0.6.7
pkgrel=1
pkgdesc="Tools for working with SAM/BAM data"
arch=('i686' 'x86_64')
url="http://lomereiter.github.io/sambamba"
license=('GPL2')
depends=('')
source=(https://github.com/lomereiter/sambamba/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux.tar.bz2)
sha1sums=('48e9699fbb4018a791b5d8b212747ac93260aeb2')

package() {
    cd "${srcdir}"
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
