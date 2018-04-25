# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=xidel
pkgver=0.9.8
pkgrel=2
pkgdesc='A command line tool to download and extract data from html/xml pages'
arch=('x86_64' 'i686')
url='http://videlibri.sourceforge.net/xidel.html'
license=('GPL')
optdepends_x86_64=('openssl: for HTTPS connections')
depends_x86_64=('glibc')
optdepends_i686=('lib32-openssl: for HTTPS connections')
depends_i686=('lib32-glibc')
source_x86_64=("${pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux64.tar.gz/download")
sha256sums_x86_64=('cf6d7391a73dbadf7c74e22206ea3f9f4f77f77d0e9d6e32d15ec400b1b843ef')
source_i686=("${pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.linux32.tar.gz/download")
sha256sums_i686=('dcc80b3a1dbf437c98d94c8dcd9b4af5f709174892bf926f36ea8dd5cb55aaec')
package() {
    cd "${srcdir}"
    install -D xidel "${pkgdir}/usr/bin/xidel"
}
