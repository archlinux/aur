# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=xidel
pkgver=0.9.9.20220424.8389.2d2ee7befb8a
pkgrel=1
pkgdesc='A command line tool to download and extract data from html/xml pages'
arch=('x86_64')
url='http://videlibri.sourceforge.net/xidel.html'
license=('GPL')
optdepends=('openssl: for HTTPS connections')
depends=('glibc')
source=("${pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20development/xidel-${pkgver}.linux64.tar.gz/download")
sha1sums=('716e8bc09fc8fec7182ae379ba237ca845f9ac4f')
package() {
    cd "${srcdir}"
    install -D xidel "${pkgdir}/usr/bin/xidel"
}
