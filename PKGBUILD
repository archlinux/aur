# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=cidrmerge
pkgver=1.5.3
pkgrel=1
pkgdesc="CIDR merging with white listing"
arch=('i686' 'x86_64')
url="http://cidrmerge.sourceforge.net/"
license=('GPL')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('d273347b639d11fcb65873c3c3362057')
PKGEXT='.pkg.tar'

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/cidrmerge" "${pkgdir}/usr/bin/cidrmerge"
}




