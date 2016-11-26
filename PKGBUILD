# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=xidel
pkgver=0.9.6
pkgrel=1
pkgdesc='A command line tool to download and extract data from html/xml pages'
arch=('x86_64' 'i686')
url='http://videlibri.sourceforge.net/xidel.html'
license=('GPL')
optdepends=('openssl: for HTTPS connections')
if [ "$CARCH" = x86_64 ]; then
    source=("${pkgname}-${pkgver}.src.tar.gz::http://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux64.tar.gz/download")
    md5sums=('1dea437cb763b6cfcdee90fc581c02da')
else
    source=("${pkgname}-${pkgver}.src.tar.gz::http://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux32.tar.gz/download")
    md5sums=('17a25f408e69e02df59524e3c13a8662')
fi
package() {
    cd "${srcdir}"
    install -D xidel "${pkgdir}/usr/bin/xidel"
}
