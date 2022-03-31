# Maintainer: James Spencer <james.s.spencer@gmail.com>

_pkgname=sambamba
pkgname="${_pkgname}-bin"
pkgver=0.8.2
pkgrel=1
pkgdesc="Tools for working with SAM/BAM data"
arch=('i686' 'x86_64')
url="http://lomereiter.github.io/sambamba"
provides=(sambamba)
license=('GPL2')
source=(https://github.com/biod/sambamba/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64-static.gz)
sha256sums=(2518b957feaf0e75df25aa34342fa19c116dfd3dffcecb75ccd302dce7790d22)

package() {
    cd "${srcdir}"
    install -Dm755 ${_pkgname}-${pkgver}-linux-amd64-static "${pkgdir}/usr/bin/${_pkgname}"
}
