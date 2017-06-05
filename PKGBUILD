# Maintainer: Nicolas Quiénot <niQo @ aur>

pkgname=jmeter-plugins-manager
pkgver=0.13
pkgrel=1
pkgdesc="Basic plugins for everyday needs."
arch=(any)
url="http://jmeter-plugins.org/"
license=(APACHE)
depends=('jmeter>=3.0')
options=(!strip)
source=(${pkgname}-${pkgver}.jar::https://jmeter-plugins.org/get/)
md5sums=('6207f4cf96b5199b49ea3d63044cac69')

package() {
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/opt/jmeter/lib/ext/${pkgname}-${pkgver}.jar"
}
