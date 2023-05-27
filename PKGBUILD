# Maintainer: Andrea Girotto  echo "naqern.tvebggb@tznvy.pbz" | tr '[a-z]' '[n-za-m]'
pkgname=java-jserialcomm
pkgver=2.9.3
pkgrel=1
pkgdesc='Platform-independent serial port access for Java.'
arch=(any)
url='https://fazecast.github.io/jSerialComm/'
license=('Apache' 'LGPL3')
depends=('java-runtime')
# previous upstream: source=(https://fazecast.github.io/jSerialComm/binaries/jSerialComm-${pkgver}.jar)
source=(https://github.com/Fazecast/jSerialComm/releases/download/v${pkgver}/jSerialComm-${pkgver}.jar)
noextract=(jSerialComm-${pkgver}.jar)
md5sums=('445272cfd999ad48433e45a181f801fa')

package() {
    install -d -m755 ${pkgdir}/usr/share/java/jSerialComm/ || return 1
    install -m644 \
        ${srcdir}/jSerialComm-${pkgver}.jar \
	    ${pkgdir}/usr/share/java/jSerialComm/jSerialComm.jar || return 1
}
