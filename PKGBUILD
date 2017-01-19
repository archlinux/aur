pkgname=crossftp-client
pkgver=1.97.9
pkgrel=1
pkgdesc="Java based free FTP, Amazon S3, Amazon Glacier, and Google Storage client."
url="http://www.crossftp.com"
arch=('any')
license=('freeware')
depends=('java-runtime-jre')
source=(http://www.crossftp.com/crossftp_${pkgver}.deb)
sha1sums=('c8ce556ca13f02095b8b72ff9230ab87870f48ff')
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
