# Maintainer: Nicolas Quiénot <niQo @ aur>

pkgname=jmeter-plugins-manager
pkgver=0.19
pkgrel=1
pkgdesc="Basic plugins for everyday needs."
arch=(any)
url="http://jmeter-plugins.org/"
license=(APACHE)
depends=('jmeter>=3.0')
options=(!strip)
source=(${pkgname}-${pkgver}.jar::https://jmeter-plugins.org/get/)
md5sums=('fde398b33c1b519c6f2312c821e8ad65')

package() {
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/opt/jmeter/lib/ext/${pkgname}-${pkgver}.jar"
}
