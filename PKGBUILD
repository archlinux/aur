# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-antispam-bee
pkgver=2.9.1
pkgrel=1
pkgdesc="Anti spam plugin"
arch=('any')
url="https://github.com/pluginkollektiv/antispam-bee"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/antispam-bee.${pkgver}.zip")
sha512sums=("1b47d1b9f5d45acacd46912c8836202cdc69574c0035558200b4887999ec6423eb19b04770e7ead7b6b8262e713ddf684b9daa7c2ac7b3dd8a2f74ea6157f90b")

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/antispam-bee" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/antispam-bee/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
