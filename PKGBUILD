# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=sambamba
pkgver=0.6.8
pkgrel=1
pkgdesc="Tools for working with SAM/BAM data"
arch=('i686' 'x86_64')
url="http://lomereiter.github.io/sambamba"
license=('GPL2')
source=(https://github.com/biod/sambamba/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-static.gz)
sha1sums=('53ad5b1fd6aae8ac69b5f4b4722a1ce5cf7cecc6')

package() {
    cd "${srcdir}"
    install -Dm755 ${pkgname}-${pkgver}-linux-static "${pkgdir}/usr/bin/${pkgname}"
}
