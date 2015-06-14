# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=xidel
pkgver=0.8.4
pkgrel=1
pkgdesc='A command line tool to download and extract data from html/xml pages'
arch=('x86_64' 'i686')
url='http://videlibri.sourceforge.net/xidel.html'
license=('GPL')
optdepends=('openssl: for HTTPS connections')
if [ "$CARCH" = x86_64 ]; then
    source=("${pkgname}-${pkgver}.src.tar.gz::http://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux64.tar.gz/download")
    md5sums=('8849e886388b367d9a13d3e8380722ff')
else
    source=("${pkgname}-${pkgver}.src.tar.gz::http://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux32.tar.gz/download")
    md5sums=('6951145a8ac3f10af675b38a41d02b7d')
fi
package() {
    cd "${srcdir}"
    install -D xidel "${pkgdir}/usr/bin/xidel"
}
