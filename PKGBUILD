# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=sambamba
pkgver=0.7.1
pkgrel=1
pkgdesc="Tools for working with SAM/BAM data"
arch=('i686' 'x86_64')
url="http://lomereiter.github.io/sambamba"
license=('GPL2')
source=(https://github.com/biod/sambamba/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-static.gz)
sha256sums=('d6e3faaa4a5440067e65b396c9a23188765ea5acc6621485c48ac86158fa62f3')

package() {
    cd "${srcdir}"
    install -Dm755 ${pkgname}-${pkgver}-linux-static "${pkgdir}/usr/bin/${pkgname}"
}
