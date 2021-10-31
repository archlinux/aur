# Maintainer: James Spencer <james.s.spencer@gmail.com>

_pkgname=sambamba
pkgname="${_pkgname}-bin"
pkgver=0.8.1
pkgrel=1
pkgdesc="Tools for working with SAM/BAM data"
arch=('i686' 'x86_64')
url="http://lomereiter.github.io/sambamba"
license=('GPL2')
source=(https://github.com/biod/sambamba/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64-static.gz)
sha256sums=('016481afe62190e6ef499a08a86cdb86000a4de53d4dfba31efe7cd7308b7089')

package() {
    cd "${srcdir}"
    install -Dm755 ${_pkgname}-${pkgver}-linux-amd64-static "${pkgdir}/usr/bin/${_pkgname}"
}
