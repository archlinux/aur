# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=xidel
pkgver=0.9
pkgrel=1
pkgdesc='A command line tool to download and extract data from html/xml pages'
arch=('x86_64' 'i686')
url='http://videlibri.sourceforge.net/xidel.html'
license=('GPL')
optdepends=('openssl: for HTTPS connections')
if [ "$CARCH" = x86_64 ]; then
    source=("${pkgname}-${pkgver}.src.tar.gz::http://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux64.tar.gz/download")
    md5sums=('fa2ad7a0de7ed3b422bfb203d59093ad')
else
    source=("${pkgname}-${pkgver}.src.tar.gz::http://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux32.tar.gz/download")
    md5sums=('c2843b8baf400bf4ac140bfe4d12d48a')
fi
package() {
    cd "${srcdir}"
    install -D xidel "${pkgdir}/usr/bin/xidel"
}
