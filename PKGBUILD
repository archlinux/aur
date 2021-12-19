pkgname=crossftp-client
pkgver=1.99.9
pkgrel=3
pkgdesc="Java based free platform-independent FTP, SFTP, FXP, WebDav, Amazon S3, Amazon Glacier, Microsoft Azure, Google storage, and OpenStack Swift client."
url="https://www.crossftp.com"
arch=('any')
license=('freeware')
depends=('java-runtime')
optdepends=('java-web-start: for running "Tools" menu applets')
source=(https://www.crossftp.com/crossftp_${pkgver}.deb)
sha256sums=('0c3fa144fd11e8c7cca6578bcfc4e4edfba669356d1ddc116ea6376904f7f5c2')
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
