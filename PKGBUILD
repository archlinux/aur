# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Nicolas Quiénot <niQo @ aur>

pkgname=jmeter-plugins-manager
pkgver=1.12
pkgrel=1
pkgdesc="Custom Plugins for Apache JMeter™"
arch=(any)
url="http://jmeter-plugins.org/"
license=('Apache-2.0')
depends=('jmeter>=3.0')
options=(!strip)
source=(${pkgname}-${pkgver}.jar::https://jmeter-plugins.org/get/)
sha256sums=('bc0551fca04ed3d8b57794c93c815101a93ac0c3849dae3f3241ae290da06aec')

package() {
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/opt/jmeter/lib/ext/${pkgname}-${pkgver}.jar"
}
