pkgname=crossftp-client
pkgver=1.99.4
pkgrel=1
pkgdesc="Java based free FTP, Amazon S3, Amazon Glacier, and Google Storage client."
url="http://www.crossftp.com"
arch=('any')
license=('freeware')
depends=('java-runtime-common')
source=(http://www.crossftp.com/crossftp_${pkgver}.deb)
sha256sums=('d2d7f256db64aea1b52fd2935183d6b0356fe28c8e40341c0b84ce668093938b')
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
