# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=xidel
pkgver=0.9.9.20210309.7795.c4e17e2d216c
pkgrel=1
pkgdesc='A command line tool to download and extract data from html/xml pages'
arch=('x86_64')
url='http://videlibri.sourceforge.net/xidel.html'
license=('GPL')
optdepends=('openssl: for HTTPS connections')
depends=('glibc')
source=("${pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20development/xidel-${pkgver}.linux64.tar.gz/download")
sha1sums=('a0cdc3e602326077e7754768fc94188fcda700f8')
package() {
    cd "${srcdir}"
    install -D xidel "${pkgdir}/usr/bin/xidel"
}
