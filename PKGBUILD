# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Nicolas Quiénot <niQo @ aur>

pkgname=jmeter-plugins-manager
pkgver=1.9
pkgrel=1
pkgdesc="Custom Plugins for Apache JMeter™"
arch=(any)
url="http://jmeter-plugins.org/"
license=('Apache')
depends=('jmeter>=3.0')
options=(!strip)
source=(${pkgname}-${pkgver}.jar::https://jmeter-plugins.org/get/)
md5sums=('52bbbe718cde7e880cce75d698a56d9d')

package() {
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/opt/jmeter/lib/ext/${pkgname}-${pkgver}.jar"
}
