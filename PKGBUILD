pkgname=keepass-plugin-qualitycolumn
_pluginname=QualityColumn
pkgver=1.2
pkgrel=1
pkgdesc="Adds support for a 'Password Quality' column in the main entry list."
license=('GPL2')
depends=('keepass')
arch=('any')
url="http://keepass.info/plugins.html#qcol"
source=("http://keepass.info/extensions/v2/qualitycolumn/${_pluginname}-${pkgver}.zip")
sha256sums=('45be13377f4e3274f9ce49b5e1e7b0bc83f043c8f87d4efbe35306424fa3a49e')

package() {
  install -Dm644 "${srcdir}/${_pluginname}.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
