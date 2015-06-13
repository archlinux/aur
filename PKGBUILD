# Maintainer: Brendan MacDonell <brendan AT macdonell.net>
pkgname=apache-ant-contrib
pkgver=1.0b3
pkgrel=4
pkgdesc="Extra task definitions for apache ant."
arch=('any')
url="http://ant-contrib.sourceforge.net"
license=('apache')
depends=('apache-ant')
source=(http://downloads.sourceforge.net/project/ant-contrib/ant-contrib/1.0b3/ant-contrib-1.0b3-bin.tar.gz)
md5sums=('ee06ff88da133dce3acc3248aee0ad83')

package() {
    install -m 755 -d "${pkgdir}/usr/share/java/apache-ant/"
    install -m 444 "${srcdir}/ant-contrib/ant-contrib-1.0b3.jar" "${pkgdir}/usr/share/java/apache-ant/"
}
