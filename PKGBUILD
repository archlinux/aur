pkgname=crossftp-client
pkgver=1.98.6
pkgrel=2
pkgdesc="Java based free FTP, Amazon S3, Amazon Glacier, and Google Storage client."
url="http://www.crossftp.com"
arch=('any')
license=('freeware')
depends=('java-runtime-common')
source=(http://www.crossftp.com/crossftp_${pkgver}.deb)
sha1sums=('374959705e10e3c0bb8894c570056d0074c8cb51')
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
