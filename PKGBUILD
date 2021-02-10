# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=xidel
pkgver=0.9.9.20201222.7728.774d4c7a6a10
pkgrel=1
pkgdesc='A command line tool to download and extract data from html/xml pages'
arch=('x86_64')
url='http://videlibri.sourceforge.net/xidel.html'
license=('GPL')
optdepends=('openssl: for HTTPS connections')
depends=('glibc')
source=("${pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20development/xidel-${pkgver}.linux64.tar.gz/download")
sha1sums=('0430a853b89c4eccbae76fde7f67dceadbbb88c2')
package() {
    cd "${srcdir}"
    install -D xidel "${pkgdir}/usr/bin/xidel"
}
