# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=xidel
pkgver=0.9.4
pkgrel=1
pkgdesc='A command line tool to download and extract data from html/xml pages'
arch=('x86_64' 'i686')
url='http://videlibri.sourceforge.net/xidel.html'
license=('GPL')
optdepends=('openssl: for HTTPS connections')
if [ "$CARCH" = x86_64 ]; then
    source=("${pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux64.tar.gz/download")
    md5sums=('c4b4d0f59e938a83c8548a404693fec8')
else
    source=("${pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux32.tar.gz/download")
    md5sums=('dfa7e55c2f49bc3b9d03456623e4eadf')
fi
package() {
    cd "${srcdir}"
    install -D xidel "${pkgdir}/usr/bin/xidel"
}
