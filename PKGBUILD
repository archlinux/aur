# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Nicolas Quiénot <niQo @ aur>

pkgname=jmeter-plugins-manager
pkgver=1.4
pkgrel=1
pkgdesc="Custom Plugins for Apache JMeter™"
arch=(any)
url="http://jmeter-plugins.org/"
license=('Apache')
depends=('jmeter>=3.0')
options=(!strip)
source=(${pkgname}-${pkgver}.jar::https://jmeter-plugins.org/get/)
md5sums=('c33f852bea88672cffa97424ba2aa536')

package() {
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/opt/jmeter/lib/ext/${pkgname}-${pkgver}.jar"
}
