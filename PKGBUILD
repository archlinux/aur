# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=cidrmerge
pkgver=1.5.3
pkgrel=2
pkgdesc="CIDR merging with white listing"
arch=('i686' 'x86_64')
url="http://cidrmerge.sourceforge.net/"
license=('GPL')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('21b36fc8004d4fc4edae71dfaf1209d3b7c8f8f282d1a582771c43522d84f088')

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/cidrmerge" "${pkgdir}/usr/bin/cidrmerge"
}




