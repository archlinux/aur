# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-antispam-bee
pkgver=2.9.3
pkgrel=1
pkgdesc="Anti spam plugin"
arch=('any')
url="https://github.com/pluginkollektiv/antispam-bee"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/antispam-bee.${pkgver}.zip")
sha512sums=('1645765a309d41af3b9f8df0c6223f57027234c56ede88e6284e68ff54f05701f17a887bdffe88a081ee6eb0a5108660a1237063547bd534b06038b4d580d015')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/antispam-bee" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/antispam-bee/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
