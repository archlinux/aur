pkgname=crossftp-client
pkgver=1.98.5
pkgrel=1
pkgdesc="Java based free FTP, Amazon S3, Amazon Glacier, and Google Storage client."
url="http://www.crossftp.com"
arch=('any')
license=('freeware')
depends=('java-runtime-jre')
source=(http://www.crossftp.com/crossftp_${pkgver}.deb)
sha1sums=('621a95384eb5a932abdf734a3f9c167963708d87')
install=.INSTALL

build() {
    mkdir -p ${srcdir}/debian
    cd ${srcdir}/debian
    tar zxvf ../data.tar.gz
}

package() {
    mkdir -p ${pkgdir}/usr/share
    mkdir -p ${pkgdir}/usr/bin
    cp -r ${srcdir}/debian/usr/share/* ${pkgdir}/usr/share/
}

# vim:set ts=2 sw=2 et:
