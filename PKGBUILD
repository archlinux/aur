# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=xidel
pkgver=0.9.9.20220102.8308.be361bf9a08e
pkgrel=1
pkgdesc='A command line tool to download and extract data from html/xml pages'
arch=('x86_64')
url='http://videlibri.sourceforge.net/xidel.html'
license=('GPL')
optdepends=('openssl: for HTTPS connections')
depends=('glibc')
source=("${pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20development/xidel-${pkgver}.linux64.tar.gz/download")
sha1sums=('8189f03732fc5b0a3b66274edf2ee9f7a20af7a2')
package() {
    cd "${srcdir}"
    install -D xidel "${pkgdir}/usr/bin/xidel"
}
