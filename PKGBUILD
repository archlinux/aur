# Original packager: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Andrea Girotto echo "naqern.tvebggb@tznvy.pbz" | tr '[a-z]' '[n-za-m]'
pkgname=java-jserialcomm
pkgver=2.5.3
pkgrel=1
pkgdesc='Platform-independent serial port access for Java.'
arch=(any)
url='https://fazecast.github.io/jSerialComm/'
license=('Apache' 'LGPL3')
depends=('java-runtime')
source=(https://github.com/Fazecast/jSerialComm/releases/download/v${pkgver}/jSerialComm-${pkgver}.jar)
noextract=(jSerialComm-${pkgver}.jar)
md5sums=('9a8b2d6a5c0007d5a62d59116b1ee320')

package() {
    install -d -m755 ${pkgdir}/usr/share/java/jSerialComm/ || return 1
    install -m644 \
        ${srcdir}/jSerialComm-${pkgver}.jar \
	    ${pkgdir}/usr/share/java/jSerialComm/jSerialComm.jar || return 1
}
