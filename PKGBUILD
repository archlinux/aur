# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-antispam-bee
pkgver=2.9.2
pkgrel=1
pkgdesc="Anti spam plugin"
arch=('any')
url="https://github.com/pluginkollektiv/antispam-bee"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/antispam-bee.${pkgver}.zip")
sha512sums=('391ed13a49502518b2edd69936c340546f595b1ecf00d8d53713d9fc8ca45b085ff16ef13abef8a028af964d428c4d73a01fd7bb7a68fe700484810aa6aa003d')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/antispam-bee" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/antispam-bee/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
