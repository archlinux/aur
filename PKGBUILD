# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=xidel
pkgver=0.9.8
pkgrel=1
pkgdesc='A command line tool to download and extract data from html/xml pages'
arch=('x86_64' 'i686')
url='http://videlibri.sourceforge.net/xidel.html'
license=('GPL')
optdepends=('openssl: for HTTPS connections')
if [ "$CARCH" = x86_64 ]; then
    source=("${pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux64.tar.gz/download")
    md5sums=('392002ba33f1fd3a25b4a4330d40a669')
else
    source=("${pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux32.tar.gz/download")
    md5sums=('4800de447c423f9d90118abe789cc2a7')
fi
package() {
    cd "${srcdir}"
    install -D xidel "${pkgdir}/usr/bin/xidel"
}
