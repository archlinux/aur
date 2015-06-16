# Maintainer: Nicolas Quiénot <niQo @ aur>

pkgname=jmeter-plugins-standard
_pkgname=JMeterPlugins-Standard
pkgver=1.2.1
pkgrel=1
pkgdesc="Basic plugins for everyday needs."
arch=(any)
url="http://jmeter-plugins.org/"
license=(APACHE)
depends=('jmeter>=2.10')
options=(!strip)
source=(http://jmeter-plugins.org/downloads/file/${_pkgname}-${pkgver}.zip)
md5sums=('7aea7cf210028d6b236cef935b12ec88')

package() {
  install -Dm644 "${srcdir}/lib/ext/${_pkgname}.jar" "${pkgdir}/opt/jmeter/lib/ext/${_pkgname}.jar"
  install -Dm644 "${srcdir}/lib/ext/CMDRunner.jar"   "${pkgdir}/opt/jmeter/lib/ext/CMDRunner.jar"
  install -Dm755 "${srcdir}/lib/ext/JMeterPluginsCMD.sh"   "${pkgdir}/opt/jmeter/lib/ext/JMeterPluginsCMD.sh"

  install -Dm644 "${srcdir}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
