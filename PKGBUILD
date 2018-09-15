pkgname=crossftp-client
pkgver=1.98.9
pkgrel=1
pkgdesc="Java based free FTP, Amazon S3, Amazon Glacier, and Google Storage client."
url="http://www.crossftp.com"
arch=('any')
license=('freeware')
depends=('java-runtime-common')
source=(http://www.crossftp.com/crossftp_${pkgver}.deb)
sha256sums=('46621bb4edf1b36672b1fb481fd4928a13b1f79964b2b82aedfb07b976cefd4c')
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
