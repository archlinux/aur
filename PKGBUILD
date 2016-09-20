# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

pkgname=pdfbox
pkgver=2.0.3
pkgrel=1
pkgdesc="An open source Java tool for working with PDF documents. (pdfbox, fontbox, jempbox)"
arch=(any)
url="https://pdfbox.apache.org"
license=('Apache 2')
depends=('java-runtime')
jarname=${pkgname}-app-${pkgver}.jar
noextract=($jarname)

source=(pdfbox
        http://www.us.apache.org/dist/${pkgname}/${pkgver}/${jarname})

sha1sums=('be3bd038b51d983c5f3ccb58f60b905cb5baab92'
          '15e6dfb410352c156ed8246ab6512b97bff7db01')

package() {
    cd "${srcdir}"

    install -D -m755 "${srcdir}/pdfbox"   "${pkgdir}/usr/bin/pdfbox"
    install -D -m644 "${srcdir}/${jarname}" "${pkgdir}/usr/share/pdfbox/pdfbox.jar"
}

