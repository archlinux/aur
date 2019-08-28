# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=sambamba
pkgver=0.7.0
pkgrel=1
pkgdesc="Tools for working with SAM/BAM data"
arch=('i686' 'x86_64')
url="http://lomereiter.github.io/sambamba"
license=('GPL2')
source=(https://github.com/biod/sambamba/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-static.gz)
sha256sums=('5a739ea53ef296639825831e110e359eab6ff421e108c7e3f4df0d67859e3024')

package() {
    cd "${srcdir}"
    install -Dm755 ${pkgname}-${pkgver}-linux-static "${pkgdir}/usr/bin/${pkgname}"
}
