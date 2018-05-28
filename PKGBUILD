# Maintainer: Nicolas Quiénot <niQo @ aur>

pkgname=jmeter-plugins-manager
pkgver=1.0.2
pkgrel=1
pkgdesc="Basic plugins for everyday needs."
arch=(any)
url="http://jmeter-plugins.org/"
license=(APACHE)
depends=('jmeter>=3.0')
options=(!strip)
source=(${pkgname}-${pkgver}.jar::https://jmeter-plugins.org/get/)
md5sums=('a6cb039eb15bea49d867c4dda7d7294b')

package() {
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/opt/jmeter/lib/ext/${pkgname}-${pkgver}.jar"
}
