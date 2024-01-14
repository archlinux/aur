# Maintainer: Andrea Girotto  echo "naqern.tvebggb@tznvy.pbz" | tr '[a-z]' '[n-za-m]'
pkgname=java-jserialcomm
pkgver=2.10.4
pkgrel=1
pkgdesc='Platform-independent serial port access for Java.'
arch=(any)
url='https://fazecast.github.io/jSerialComm/'
license=('Apache' 'LGPL3')
depends=('java-runtime')
# previous upstreams: 
# source=(https://github.com/Fazecast/jSerialComm/releases/download/v${pkgver}/jSerialComm-${pkgver}.jar)
# source=(https://fazecast.github.io/jSerialComm/binaries/jSerialComm-${pkgver}.jar)
source=(https://oss.sonatype.org/service/local/repositories/releases/content/com/fazecast/jSerialComm/${pkgver}/jSerialComm-${pkgver}.jar)
noextract=(jSerialComm-${pkgver}.jar)
md5sums=('46cd1207d1d4ed59f9b41161b5927480')

package() {
    install -d -m755 ${pkgdir}/usr/share/java/jSerialComm/ || return 1
    install -m644 \
        ${srcdir}/jSerialComm-${pkgver}.jar \
	    ${pkgdir}/usr/share/java/jSerialComm/jSerialComm.jar || return 1
}
