pkgname=crossftp-client
pkgver=1.99.6
pkgrel=3
pkgdesc="Java based free platform-independent FTP, SFTP, WebDav, Amazon S3, Amazon Glacier, Microsoft Azure, Google storage, and OpenStack Swift client."
url="http://www.crossftp.com"
arch=('any')
license=('freeware')
depends=('java-runtime')
source=(http://www.crossftp.com/crossftp_${pkgver}.deb)
sha256sums=('9dc4289f0bf8258915bc934711a940447a2d4700df8bb447913a99733927cd22')
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
