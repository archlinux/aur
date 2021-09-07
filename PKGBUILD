pkgname=crossftp-client
pkgver=1.99.7
pkgrel=1
pkgdesc="Java based free platform-independent FTP, SFTP, WebDav, Amazon S3, Amazon Glacier, Microsoft Azure, Google storage, and OpenStack Swift client."
url="https://www.crossftp.com"
arch=('any')
license=('freeware')
depends=('java-runtime')
source=(https://www.crossftp.com/crossftp_${pkgver}.deb)
sha256sums=('75d043896c260346d83ec11566a8b951c980762484b0b3672b936a9d1710c4d3')
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
